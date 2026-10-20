import 'dart:async';

import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/errors/app_exception.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/check_platform.dart';
import 'package:easy_birthday/core/utils/gender_utils.dart';
import 'package:easy_birthday/core/utils/i18n/language_model.dart';
import 'package:easy_birthday/core/utils/i18n/slang_settings.dart';
import 'package:easy_birthday/features/event/domain/usecases/get_event_usecase.dart';
import 'package:easy_birthday/features/settings/domain/usecases/get_app_settings_usecase.dart';
import 'package:easy_birthday/features/user/data/models/persona_model.dart';
import 'package:easy_birthday/features/user/data/models/role_model.dart';
import 'package:easy_birthday/features/user/domain/usecases/get_local_partner_usecase.dart';
import 'package:easy_birthday/features/user/domain/usecases/get_local_user_usecase.dart';
import 'package:easy_birthday/features/user/domain/usecases/get_user_usecase.dart';
import 'package:easy_birthday/features/user/domain/usecases/create_partner_usecase.dart';
import 'package:easy_birthday/features/wear_os/domain/usecases/get_saved_event_id_usecase.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_bloc.freezed.dart';

@freezed
sealed class SplashEvent with _$SplashEvent {
  const factory SplashEvent.init() = _Init;
}

@Freezed(equal: false)
sealed class SplashState with _$SplashState {
  const factory SplashState.initial() = Initial;
  const factory SplashState.loading() = Loading;
  const factory SplashState.navigateToHome() = NavigateToHome;
  const factory SplashState.navigateToLogin() = NavigateToLogin;
  const factory SplashState.navigateToOnboarding() = NavigateToOnboarding;
  const factory SplashState.navigateToFirstLogin() = NavigateToFirstLogin;
  const factory SplashState.navigateToWearOsLogin() = NavigateToWearOsLogin;
  const factory SplashState.navigateToWearOsCategories(String eventId) =
      NavigateToWearOsCategories;
}

extension SplashStateX on SplashState {
  bool get isOneShot => switch (this) {
    Initial() || Loading() => false,
    NavigateToHome() ||
    NavigateToLogin() ||
    NavigateToOnboarding() ||
    NavigateToFirstLogin() ||
    NavigateToWearOsLogin() ||
    NavigateToWearOsCategories() => true,
  };
}

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final GetAppSettingsUseCase getAppSettingsUseCase;
  final GetLocalUserUseCase getLocalUserUseCase;
  final GetLocalPartnerUseCase getLocalPartnerUseCase;
  final GetUserUseCase getUserUseCase;
  final GetEventUseCase getEventUseCase;
  final CreatePartnerUseCase createPartnerUseCase;
  final GetSavedEventIdUseCase getSavedEventIdUseCase;

  SplashBloc({
    required this.getAppSettingsUseCase,
    required this.getLocalUserUseCase,
    required this.getLocalPartnerUseCase,
    required this.getUserUseCase,
    required this.getEventUseCase,
    required this.createPartnerUseCase,
    required this.getSavedEventIdUseCase,
  }) : super(const .initial()) {
    on<_Init>(_init);
  }

  factory SplashBloc.fromContext(BuildContext context) => SplashBloc(
    getAppSettingsUseCase: context.read<GetAppSettingsUseCase>(),
    getLocalUserUseCase: context.read<GetLocalUserUseCase>(),
    getLocalPartnerUseCase: context.read<GetLocalPartnerUseCase>(),
    getUserUseCase: context.read<GetUserUseCase>(),
    getEventUseCase: context.read<GetEventUseCase>(),
    createPartnerUseCase: context.read<CreatePartnerUseCase>(),
    getSavedEventIdUseCase: context.read<GetSavedEventIdUseCase>(),
  );

  FutureOr<void> _init(_Init event, Emitter<SplashState> emit) async {
    emit(const .loading());
    final session = SessionService();
    bool isWearOs = false;
    try {
      session.appSettings = getAppSettingsUseCase();
      session.user = getLocalUserUseCase();
      if (session.user.role != RoleModel.partner) {
        session.partner = getLocalPartnerUseCase();
      }

      changeAppColors(session.appSettings.appColor);
      changeGender(male: checkIfMaleGender(session.user.gender));
      // Hebrew is deferred-loaded: the locale must be active before navigating.
      (_, isWearOs) = await (
        changeLanguage(
          LanguageModel.getAppLocale(session.appSettings.languageCode),
        ),
        checkIfWearOS(),
      ).wait;
      final String? wearOsEventId = getSavedEventIdUseCase();
      if (isWearOs && wearOsEventId != null) {
        emit(.navigateToWearOsCategories(wearOsEventId));
        return;
      }
      if (session.user.phoneNumber == "") {
        emit(_loginState(isWearOs));
        return;
      }

      session.user = await getUserUseCase(session.user.phoneNumber);
      changeGender(male: checkIfMaleGender(session.user.gender));
      if (session.user.eventId != null) {
        session.event = await getEventUseCase();
      }
      final String? partnerPhone = session.event?.users
          .where((user) => user != session.user.phoneNumber)
          .firstOrNull;

      if (session.user.role.isNotPartner()) {
        if (partnerPhone != null) {
          session.partner = await _findUser(partnerPhone) ?? session.partner;
        }
        if (session.user.registerComplete) {
          emit(
            !isWearOs || session.event == null
                ? const .navigateToHome()
                : .navigateToWearOsCategories(session.event!.eventId),
          );
        } else {
          emit(
            !isWearOs
                ? const .navigateToOnboarding()
                : const .navigateToWearOsLogin(),
          );
        }
      } else if (isWearOs) {
        emit(const .navigateToWearOsLogin());
      } else {
        final owner = partnerPhone == null
            ? null
            : await _findUser(partnerPhone);
        // Device copy only: the owner's own document must not be rewritten
        // with this (possibly stale) read.
        if (owner != null) await createPartnerUseCase(owner);
        emit(
          session.user.registerComplete
              ? const .navigateToHome()
              : const .navigateToFirstLogin(),
        );
      }
    } catch (e) {
      // Offline, deleted account or a corrupt document: never hang on the
      // splash screen, send the user to sign in again instead.
      debugPrint('Splash init failed: $e');
      emit(_loginState(isWearOs));
    }
  }

  /// The user of [phoneNumber], or null when their document is gone (the
  /// partner deleted their account): that must not lock the other one out.
  Future<PersonaModel?> _findUser(String phoneNumber) async {
    try {
      return await getUserUseCase(phoneNumber);
    } on AppException catch (e) {
      if (e.type == AppErrorType.notFound) return null;
      rethrow;
    }
  }

  SplashState _loginState(bool isWearOs) =>
      !isWearOs ? const .navigateToLogin() : const .navigateToWearOsLogin();
}
