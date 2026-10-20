import 'dart:async';

import 'package:easy_birthday/core/errors/app_exception.dart';
import 'package:easy_birthday/core/services/encryption_service.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/features/auth/domain/usecases/send_otp_usecase.dart';
import 'package:easy_birthday/features/auth/domain/usecases/verify_otp_usecase.dart';
import 'package:easy_birthday/features/user/domain/usecases/register_owner_usecase.dart';
import 'package:easy_birthday/features/user/domain/usecases/user_exists_usecase.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_bloc.freezed.dart';

@freezed
sealed class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.navigateToLogin() = _NavigateToLogin;
  const factory RegisterEvent.sendCode({
    required String phoneNumber,
    required String password,
  }) = _SendCode;
  const factory RegisterEvent.verifyOtp({
    required String verificationId,
    required String otpCode,
    required String phoneNumber,
    required String password,
  }) = _VerifyOtp;
}

@Freezed(equal: false)
sealed class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = Initial;
  const factory RegisterState.loading() = Loading;
  const factory RegisterState.errorMessage(String error) = ErrorMessage;
  const factory RegisterState.phoneExists() = PhoneExists;
  const factory RegisterState.navigateToLogin() = NavigateToLogin;
  const factory RegisterState.navigateToOtp(String verificationId) =
      NavigateToOtp;
  const factory RegisterState.navigateToOnboarding() = NavigateToOnboarding;
}

extension RegisterStateX on RegisterState {
  bool get isOneShot => switch (this) {
    Initial() || Loading() => false,
    ErrorMessage() ||
    PhoneExists() ||
    NavigateToLogin() ||
    NavigateToOtp() ||
    NavigateToOnboarding() => true,
  };
}

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserExistsUseCase userExistsUseCase;
  final SendOtpUseCase sendOtpUseCase;
  final VerifyOtpUseCase verifyOtpUseCase;
  final RegisterOwnerUseCase registerOwnerUseCase;

  RegisterBloc({
    required this.userExistsUseCase,
    required this.sendOtpUseCase,
    required this.verifyOtpUseCase,
    required this.registerOwnerUseCase,
  }) : super(const .initial()) {
    on<_NavigateToLogin>(_navigateToLogin);
    on<_SendCode>(_sendCode);
    on<_VerifyOtp>(_verifyOtp);
  }

  factory RegisterBloc.fromContext(BuildContext context) => RegisterBloc(
    userExistsUseCase: context.read<UserExistsUseCase>(),
    sendOtpUseCase: context.read<SendOtpUseCase>(),
    verifyOtpUseCase: context.read<VerifyOtpUseCase>(),
    registerOwnerUseCase: context.read<RegisterOwnerUseCase>(),
  );

  FutureOr<void> _navigateToLogin(
    _NavigateToLogin event,
    Emitter<RegisterState> emit,
  ) {
    emit(const .navigateToLogin());
  }

  /// True while a registration step runs. A second tap, or the code page's
  /// OK button re-enabled before a slow request finished, must not start
  /// another one.
  bool _busy = false;

  /// The code that already signed in: retrying after creating the account
  /// failed skips verifying it again (Firebase rejects a used code).
  String? _verifiedId;

  Future<void> _exclusive(Future<void> Function() step) async {
    if (_busy) return;
    _busy = true;
    try {
      await step();
    } finally {
      _busy = false;
    }
  }

  FutureOr<void> _sendCode(_SendCode event, Emitter<RegisterState> emit) =>
      _exclusive(() async {
        emit(const .loading());
        try {
          // Registering an existing number would overwrite that account.
          if (await userExistsUseCase(event.phoneNumber)) {
            _emitOverForm(emit, const .phoneExists());
            return;
          }
          final verificationId = await sendOtpUseCase(event.phoneNumber);
          if (verificationId == null) {
            // Verified instantly (Android): no code to enter.
            await _register(event.phoneNumber, event.password, emit);
            return;
          }
          _emitOverForm(emit, .navigateToOtp(verificationId));
        } catch (e) {
          debugPrint('RegisterBloc send code: $e');
          _emitError(emit, _messageOf(e));
        }
      });

  FutureOr<void> _verifyOtp(_VerifyOtp event, Emitter<RegisterState> emit) =>
      _exclusive(() async {
        if (event.verificationId != _verifiedId) {
          try {
            await verifyOtpUseCase(
              verificationId: event.verificationId,
              smsCode: event.otpCode,
            );
          } catch (e) {
            debugPrint('RegisterBloc verify otp: $e');
            _emitError(emit, _messageOf(e));
            return;
          }
          _verifiedId = event.verificationId;
        }
        await _register(event.phoneNumber, event.password, emit);
      });

  /// Creates the account once the phone number is verified.
  Future<void> _register(
    String phoneNumber,
    String password,
    Emitter<RegisterState> emit,
  ) async {
    try {
      await registerOwnerUseCase(
        phoneNumber: phoneNumber,
        password: MyEncryptionDecryption.encryptFernet(password).base64,
      );
      emit(const .navigateToOnboarding());
    } catch (e) {
      debugPrint('RegisterBloc register: $e');
      _emitError(emit, t.operation_not_allowed);
    }
  }

  String _messageOf(Object e) => e is AppException && e.message.isNotEmpty
      ? e.message
      : t.operation_not_allowed;

  void _emitError(Emitter<RegisterState> emit, String message) =>
      _emitOverForm(emit, .errorMessage(message));

  /// Emits a one-shot state that keeps this page open. One-shot states aren't
  /// built, so leave the spinner for the form first.
  void _emitOverForm(Emitter<RegisterState> emit, RegisterState oneShot) {
    if (state is Loading) emit(const .initial());
    emit(oneShot);
  }
}
