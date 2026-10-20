import 'dart:async';

import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/errors/app_exception.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/i18n/slang_settings.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/features/auth/domain/usecases/login_with_password_usecase.dart';
import 'package:easy_birthday/features/auth/domain/usecases/send_otp_usecase.dart';
import 'package:easy_birthday/features/auth/domain/usecases/verify_otp_usecase.dart';
import 'package:easy_birthday/features/event/data/models/event_model.dart';
import 'package:easy_birthday/features/event/domain/usecases/get_event_usecase.dart';
import 'package:easy_birthday/features/settings/domain/usecases/save_app_settings_usecase.dart';
import 'package:easy_birthday/features/user/data/models/persona_model.dart';
import 'package:easy_birthday/features/user/data/models/role_model.dart';
import 'package:easy_birthday/features/user/domain/usecases/create_partner_usecase.dart';
import 'package:easy_birthday/features/user/domain/usecases/get_user_usecase.dart';
import 'package:easy_birthday/features/user/domain/usecases/save_user_usecase.dart';
import 'package:easy_birthday/features/user/domain/usecases/user_exists_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_bloc.freezed.dart';

@freezed
sealed class LoginEvent with _$LoginEvent {
  const factory LoginEvent.navigateToRegister() = _NavigateToRegister;
  const factory LoginEvent.loginWithPassword({
    required String phoneNumber,
    required String password,
    required bool isWatch,
  }) = _LoginWithPassword;
  const factory LoginEvent.sendCode({
    required String phoneNumber,
    required bool isWatch,
  }) = _SendCode;
  const factory LoginEvent.verifyOtp({
    required String verificationId,
    required String otpCode,
    required String phoneNumber,
    required bool isWatch,
  }) = _VerifyOtp;
}

@Freezed(equal: false)
sealed class LoginState with _$LoginState {
  const factory LoginState.initial() = Initial;
  const factory LoginState.loading() = Loading;
  const factory LoginState.errorMessage(String error) = ErrorMessage;
  const factory LoginState.navigateToRegister() = NavigateToRegister;
  const factory LoginState.navigateToOtp(String verificationId) = NavigateToOtp;
  const factory LoginState.navigateToHome() = NavigateToHome;
  const factory LoginState.navigateToOnboarding() = NavigateToOnboarding;
  const factory LoginState.navigateToFirstLogin() = NavigateToFirstLogin;

  /// Result sent back to the watch: `success`, `failed` or `partner`. The
  /// phone then continues into the app like a normal login.
  const factory LoginState.messageToWatch(String message) = MessageToWatch;
}

extension LoginStateX on LoginState {
  bool get isOneShot => switch (this) {
    Initial() || Loading() => false,
    ErrorMessage() ||
    NavigateToRegister() ||
    NavigateToOtp() ||
    NavigateToHome() ||
    NavigateToOnboarding() ||
    NavigateToFirstLogin() ||
    MessageToWatch() => true,
  };
}

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final SendOtpUseCase sendOtpUseCase;
  final VerifyOtpUseCase verifyOtpUseCase;
  final LoginWithPasswordUseCase loginWithPasswordUseCase;
  final UserExistsUseCase userExistsUseCase;
  final GetUserUseCase getUserUseCase;
  final SaveUserUseCase saveUserUseCase;
  final CreatePartnerUseCase createPartnerUseCase;
  final GetEventUseCase getEventUseCase;
  final SaveAppSettingsUseCase saveAppSettingsUseCase;

  LoginBloc({
    required this.sendOtpUseCase,
    required this.verifyOtpUseCase,
    required this.loginWithPasswordUseCase,
    required this.userExistsUseCase,
    required this.getUserUseCase,
    required this.saveUserUseCase,
    required this.createPartnerUseCase,
    required this.getEventUseCase,
    required this.saveAppSettingsUseCase,
  }) : super(const .initial()) {
    on<_NavigateToRegister>(_navigateToRegister);
    on<_LoginWithPassword>(_loginWithPassword);
    on<_SendCode>(_sendCode);
    on<_VerifyOtp>(_verifyOtp);
  }

  factory LoginBloc.fromContext(BuildContext context) => LoginBloc(
    sendOtpUseCase: context.read<SendOtpUseCase>(),
    verifyOtpUseCase: context.read<VerifyOtpUseCase>(),
    loginWithPasswordUseCase: context.read<LoginWithPasswordUseCase>(),
    userExistsUseCase: context.read<UserExistsUseCase>(),
    getUserUseCase: context.read<GetUserUseCase>(),
    saveUserUseCase: context.read<SaveUserUseCase>(),
    createPartnerUseCase: context.read<CreatePartnerUseCase>(),
    getEventUseCase: context.read<GetEventUseCase>(),
    saveAppSettingsUseCase: context.read<SaveAppSettingsUseCase>(),
  );

  FutureOr<void> _navigateToRegister(
    _NavigateToRegister event,
    Emitter<LoginState> emit,
  ) {
    emit(const .navigateToRegister());
  }

  /// True while a login runs. A second tap, or the code page's OK button
  /// re-enabled before a slow login finished, must not start another one.
  bool _busy = false;

  /// The code that already signed in: retrying after a later step failed
  /// skips verifying it again (Firebase rejects a used code).
  String? _verifiedId;

  Future<void> _exclusive(Future<void> Function() login) async {
    if (_busy) return;
    _busy = true;
    try {
      await login();
    } finally {
      _busy = false;
    }
  }

  /// Password login: compares with the password saved for this phone (as in
  /// earlier versions; no Firebase password sign-in for now).
  FutureOr<void> _loginWithPassword(
    _LoginWithPassword event,
    Emitter<LoginState> emit,
  ) => _exclusive(() async {
    emit(const .loading());
    try {
      final persona = await loginWithPasswordUseCase(
        phoneNumber: event.phoneNumber,
        password: event.password,
      );
      await _completeLogin(persona, emit, event.isWatch);
    } on AppException catch (e) {
      debugPrint('LoginBloc password login: $e');
      _emitError(emit, switch (e.type) {
        AppErrorType.notFound => t.phone_not_exist_system,
        AppErrorType.wrongPassword => t.wrong_password,
        _ => t.operation_not_allowed,
      });
    } catch (e) {
      debugPrint('LoginBloc password login: $e');
      _emitError(emit, t.operation_not_allowed);
    }
  });

  FutureOr<void> _sendCode(_SendCode event, Emitter<LoginState> emit) =>
      _exclusive(() async {
        emit(const .loading());
        try {
          if (!await userExistsUseCase(event.phoneNumber)) {
            _emitError(emit, t.phone_not_exist_system);
            return;
          }
          final verificationId = await sendOtpUseCase(event.phoneNumber);
          if (verificationId == null) {
            // Verified instantly (Android): no code to enter.
            await _loginVerified(event.phoneNumber, emit, event.isWatch);
            return;
          }
          _emitOverForm(emit, .navigateToOtp(verificationId));
        } catch (e) {
          debugPrint('LoginBloc send code: $e');
          _emitError(emit, _messageOf(e));
        }
      });

  FutureOr<void> _verifyOtp(_VerifyOtp event, Emitter<LoginState> emit) =>
      _exclusive(() async {
        if (event.verificationId != _verifiedId) {
          try {
            await verifyOtpUseCase(
              verificationId: event.verificationId,
              smsCode: event.otpCode,
            );
          } catch (e) {
            debugPrint('LoginBloc verify otp: $e');
            _emitError(emit, _messageOf(e));
            return;
          }
          _verifiedId = event.verificationId;
        }
        await _loginVerified(event.phoneNumber, emit, event.isWatch);
      });

  /// Continues after the phone number was verified (code or instantly).
  Future<void> _loginVerified(
    String phoneNumber,
    Emitter<LoginState> emit,
    bool isWatch,
  ) async {
    try {
      final persona = await getUserUseCase(phoneNumber);
      await _completeLogin(persona, emit, isWatch);
    } catch (e) {
      debugPrint('LoginBloc otp login: $e');
      _emitError(emit, t.operation_not_allowed);
    }
  }

  String _messageOf(Object e) => e is AppException && e.message.isNotEmpty
      ? e.message
      : t.operation_not_allowed;

  void _emitError(Emitter<LoginState> emit, String message) =>
      _emitOverForm(emit, .errorMessage(message));

  /// Emits a one-shot state that keeps this page open. One-shot states aren't
  /// built, so leave the spinner for the form first.
  void _emitOverForm(Emitter<LoginState> emit, LoginState oneShot) {
    if (state is Loading) emit(const .initial());
    emit(oneShot);
  }

  /// Apply and persist this account's own color instead of keeping the
  /// previous account's color/settings from before the logout, and keep the
  /// language picked on this page.
  Future<void> _applyUserSettings() async {
    final Color color =
        SessionService().event?.appColor ?? AppColors.primaryColor;
    changeAppColors(color);
    await saveAppSettingsUseCase(
      SessionService().appSettings.copyWith(
        appColor: color,
        languageCode: getLanguageCode(),
      ),
    );
  }

  /// The user of [phoneNumber], or null when there is no such account (the
  /// partner deleted theirs): that must not block the other one's login.
  Future<PersonaModel?> _findUser(String phoneNumber) async {
    try {
      return await getUserUseCase(phoneNumber);
    } on AppException catch (e) {
      if (e.type == AppErrorType.notFound) return null;
      rethrow;
    }
  }

  String? _partnerPhone(PersonaModel persona) => SessionService().event?.users
      .where((user) => user != persona.phoneNumber)
      .firstOrNull;

  Future<void> _completeLogin(
    PersonaModel persona,
    Emitter<LoginState> emit,
    bool isWatch,
  ) async {
    final eventId = persona.eventId;
    final (_, event) = await (
      saveUserUseCase(persona),
      eventId == null ? Future<EventModel?>.value() : getEventUseCase(eventId),
    ).wait;
    SessionService().event = event;
    await _applyUserSettings();
    if (persona.role.isNotPartner()) {
      // Load the partner too: settings, app info and texts all need it.
      final partnerPhone = _partnerPhone(persona);
      final partner = partnerPhone == null
          ? null
          : await _findUser(partnerPhone);
      if (partner != null) await createPartnerUseCase(partner);
      if (isWatch) {
        emit(.messageToWatch(persona.registerComplete ? 'success' : 'failed'));
      }
      emit(
        persona.registerComplete
            ? const .navigateToHome()
            : const .navigateToOnboarding(),
      );
    } else {
      if (isWatch) emit(const .messageToWatch('partner'));
      final partnerPhone = _partnerPhone(persona);
      final owner = partnerPhone == null ? null : await _findUser(partnerPhone);
      // Device copy only: the owner's own document must not be rewritten.
      if (owner != null) await createPartnerUseCase(owner);
      emit(
        persona.registerComplete
            ? const .navigateToHome()
            : const .navigateToFirstLogin(),
      );
    }
  }
}
