import 'dart:async';

import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/services/encryption_service.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/features/auth/domain/usecases/delete_account_usecase.dart';
import 'package:easy_birthday/features/auth/domain/usecases/logout_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/update_event_usecase.dart';
import 'package:easy_birthday/features/settings/domain/usecases/save_app_settings_usecase.dart';
import 'package:easy_birthday/features/user/data/models/role_model.dart';
import 'package:easy_birthday/features/user/domain/usecases/save_partner_usecase.dart';
import 'package:easy_birthday/features/user/domain/usecases/save_user_usecase.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_bloc.freezed.dart';

@freezed
sealed class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.changeColor(Color color) = _ChangeColor;
  const factory SettingsEvent.changeLanguage(String languageCode) =
      _ChangeLanguage;
  const factory SettingsEvent.changeGender({
    required String ownerGender,
    required String partnerGender,
  }) = _ChangeGender;
  const factory SettingsEvent.logout() = _Logout;
  const factory SettingsEvent.deleteAccount() = _DeleteAccount;
  const factory SettingsEvent.changePassword(String password) = _ChangePassword;
}

@Freezed(equal: false)
sealed class SettingsState with _$SettingsState {
  const factory SettingsState.initial() = Initial;
  const factory SettingsState.errorMessage(String error) = ErrorMessage;
  const factory SettingsState.navigateToBuildApp({
    required int seconds,
    required String description,
  }) = NavigateToBuildApp;
  const factory SettingsState.navigateToLogin() = NavigateToLogin;
  const factory SettingsState.deleteAccountFailed() = DeleteAccountFailed;
  const factory SettingsState.passwordChangeFailed() = PasswordChangeFailed;
}

extension SettingsStateX on SettingsState {
  bool get isOneShot => switch (this) {
    Initial() => false,
    _ => true,
  };
}

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final LogoutUseCase logoutUseCase;
  final DeleteAccountUseCase deleteAccountUseCase;
  final SaveAppSettingsUseCase saveAppSettingsUseCase;
  final SaveUserUseCase saveUserUseCase;
  final SavePartnerUseCase savePartnerUseCase;
  final UpdateEventUseCase updateEventUseCase;

  SettingsBloc({
    required this.logoutUseCase,
    required this.deleteAccountUseCase,
    required this.saveAppSettingsUseCase,
    required this.saveUserUseCase,
    required this.savePartnerUseCase,
    required this.updateEventUseCase,
  }) : super(const .initial()) {
    on<_ChangeColor>(_changeColor);
    on<_ChangeLanguage>(_changeLanguage);
    on<_ChangeGender>(_changeGender);
    on<_Logout>(_logout);
    on<_DeleteAccount>(_deleteAccount);
    on<_ChangePassword>(_changePassword);
  }

  factory SettingsBloc.fromContext(BuildContext context) => SettingsBloc(
    logoutUseCase: context.read<LogoutUseCase>(),
    deleteAccountUseCase: context.read<DeleteAccountUseCase>(),
    saveAppSettingsUseCase: context.read<SaveAppSettingsUseCase>(),
    saveUserUseCase: context.read<SaveUserUseCase>(),
    savePartnerUseCase: context.read<SavePartnerUseCase>(),
    updateEventUseCase: context.read<UpdateEventUseCase>(),
  );

  /// A logout or account deletion is running; repeated confirmations (the
  /// dialog can be reopened meanwhile) are ignored.
  bool _leaving = false;

  FutureOr<void> _changeColor(
    _ChangeColor event,
    Emitter<SettingsState> emit,
  ) async {
    final session = SessionService();
    final previousColor = AppColors.primaryColor;
    changeAppColors(event.color);
    try {
      await saveAppSettingsUseCase(
        session.appSettings.copyWith(appColor: event.color),
      );
    } catch (e) {
      // Not saved: keep showing the color the app will start with.
      changeAppColors(previousColor);
      debugPrint('SettingsBloc changeColor: $e');
      emit(.errorMessage(e.toString()));
      return;
    }
    final currentEvent = session.event;
    if (session.user.role.isNotPartner() && currentEvent != null) {
      try {
        await updateEventUseCase(currentEvent.copyWith(appColor: event.color));
      } catch (e) {
        // The color is already saved on this device, so still rebuild; just
        // tell the user it didn't reach the shared event.
        debugPrint('SettingsBloc update event color: $e');
        emit(.errorMessage(e.toString()));
      }
    }
    emit(.navigateToBuildApp(seconds: 1, description: t.change_color));
  }

  FutureOr<void> _changeLanguage(
    _ChangeLanguage event,
    Emitter<SettingsState> emit,
  ) async {
    try {
      await saveAppSettingsUseCase(
        SessionService().appSettings.copyWith(languageCode: event.languageCode),
      );
      emit(.navigateToBuildApp(seconds: 2, description: t.change_language));
    } catch (e) {
      debugPrint('SettingsBloc changeLanguage: $e');
      emit(.errorMessage(e.toString()));
    }
  }

  FutureOr<void> _changeGender(
    _ChangeGender event,
    Emitter<SettingsState> emit,
  ) async {
    final session = SessionService();
    // Both saves are local-first, so attempt each even if the other's remote
    // write fails, then report once.
    final results = await Future.wait([
      _tryRun(
        () => saveUserUseCase(session.user.copyWith(gender: event.ownerGender)),
      ),
      if (session.user.role.isNotPartner() && session.partner != null)
        _tryRun(
          () => savePartnerUseCase(
            session.partner!.copyWith(gender: event.partnerGender),
          ),
        ),
    ]);
    final error = results.nonNulls.firstOrNull;
    if (error != null) {
      debugPrint('SettingsBloc changeGender: $error');
      emit(.errorMessage(error.toString()));
    }
  }

  FutureOr<void> _logout(
    _Logout event,
    Emitter<SettingsState> emit,
  ) async {
    if (_leaving) return;
    _leaving = true;
    try {
      await logoutUseCase();
    } catch (e) {
      debugPrint('SettingsBloc logout: $e');
    } finally {
      // Always leave the signed-in area, even if local cleanup hit an error.
      emit(const .navigateToLogin());
    }
  }

  FutureOr<void> _deleteAccount(
    _DeleteAccount event,
    Emitter<SettingsState> emit,
  ) async {
    if (_leaving) return;
    _leaving = true;
    try {
      await deleteAccountUseCase();
      emit(const .navigateToLogin());
    } catch (e) {
      _leaving = false;
      debugPrint('SettingsBloc deleteAccount: $e');
      emit(const .deleteAccountFailed());
    }
  }

  FutureOr<void> _changePassword(
    _ChangePassword event,
    Emitter<SettingsState> emit,
  ) async {
    try {
      final encryptedPassword = MyEncryptionDecryption.encryptFernet(
        event.password,
      ).base64;
      await saveUserUseCase(
        SessionService().user.copyWith(password: encryptedPassword),
      );
    } catch (e) {
      debugPrint('SettingsBloc changePassword: $e');
      emit(const .passwordChangeFailed());
    }
  }

  /// Runs [action] and returns its error instead of throwing (null on success).
  Future<Object?> _tryRun(Future<void> Function() action) async {
    try {
      await action();
      return null;
    } catch (e) {
      return e;
    }
  }
}
