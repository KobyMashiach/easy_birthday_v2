import 'dart:async';

import 'package:easy_birthday/core/errors/app_exception.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/features/auth/domain/usecases/send_otp_usecase.dart';
import 'package:easy_birthday/features/auth/domain/usecases/verify_otp_usecase.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password_bloc.freezed.dart';

@freezed
sealed class ChangePasswordEvent with _$ChangePasswordEvent {
  const factory ChangePasswordEvent.sendOtp() = _SendOtp;
  const factory ChangePasswordEvent.sendOtpAgain() = _SendOtpAgain;
  const factory ChangePasswordEvent.verifyOtp(String otpCode) = _VerifyOtp;
}

@Freezed(equal: false)
sealed class ChangePasswordState with _$ChangePasswordState {
  const factory ChangePasswordState.initial({required bool otpVerified}) =
      Initial;
  const factory ChangePasswordState.loading({required bool otpVerified}) =
      Loading;
  const factory ChangePasswordState.loaded({required bool otpVerified}) =
      Loaded;
  const factory ChangePasswordState.errorMessage({
    required bool otpVerified,
    required String error,
  }) = ErrorMessage;
  const factory ChangePasswordState.navigateToOtp({
    required bool otpVerified,
    required String verificationId,
  }) = NavigateToOtp;
  const factory ChangePasswordState.verificationSucceeded({
    required bool otpVerified,
  }) = VerificationSucceeded;
}

extension ChangePasswordStateX on ChangePasswordState {
  bool get isOneShot => switch (this) {
    Initial() || Loading() || Loaded() => false,
    _ => true,
  };
}

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  final SendOtpUseCase sendOtpUseCase;
  final VerifyOtpUseCase verifyOtpUseCase;

  String _verificationId = '';
  bool _otpVerified = false;

  ChangePasswordBloc({
    required this.sendOtpUseCase,
    required this.verifyOtpUseCase,
  }) : super(const .initial(otpVerified: false)) {
    on<_SendOtp>(_sendOtp);
    on<_SendOtpAgain>(_sendOtpAgain);
    on<_VerifyOtp>(_verifyOtp);
  }

  factory ChangePasswordBloc.fromContext(BuildContext context) =>
      ChangePasswordBloc(
        sendOtpUseCase: context.read<SendOtpUseCase>(),
        verifyOtpUseCase: context.read<VerifyOtpUseCase>(),
      );

  /// One-shot states are excluded from `buildWhen`, so settle the page on
  /// [Loaded] first (leaves the spinner / shows the new [_otpVerified]).
  void _emitOneShot(
    Emitter<ChangePasswordState> emit,
    ChangePasswordState oneShot,
  ) {
    emit(.loaded(otpVerified: _otpVerified));
    emit(oneShot);
  }

  FutureOr<void> _sendOtp(_SendOtp event, Emitter<ChangePasswordState> emit) =>
      _requestOtp(emit);

  Future<void> _requestOtp(Emitter<ChangePasswordState> emit) async {
    emit(.loading(otpVerified: _otpVerified));
    try {
      final verificationId = await sendOtpUseCase(
        SessionService().user.phoneNumber,
      );
      if (verificationId == null) {
        // Verified instantly (Android): there is no code page to open.
        _otpVerified = true;
        emit(.loaded(otpVerified: _otpVerified));
        return;
      }
      _verificationId = verificationId;
      _emitOneShot(
        emit,
        .navigateToOtp(
          otpVerified: _otpVerified,
          verificationId: _verificationId,
        ),
      );
    } catch (e) {
      debugPrint('ChangePasswordBloc sendOtp: $e');
      _emitOneShot(
        emit,
        .errorMessage(otpVerified: _otpVerified, error: _messageOf(e)),
      );
    }
  }

  FutureOr<void> _sendOtpAgain(
    _SendOtpAgain event,
    Emitter<ChangePasswordState> emit,
  ) async {
    emit(.loading(otpVerified: _otpVerified));
    // Let the code page finish closing before a new one may be pushed.
    await Future.delayed(const Duration(milliseconds: 500));
    await _requestOtp(emit);
  }

  FutureOr<void> _verifyOtp(
    _VerifyOtp event,
    Emitter<ChangePasswordState> emit,
  ) async {
    try {
      await verifyOtpUseCase(
        verificationId: _verificationId,
        smsCode: event.otpCode,
      );
      _otpVerified = true;
      _emitOneShot(emit, .verificationSucceeded(otpVerified: _otpVerified));
    } catch (e) {
      debugPrint('ChangePasswordBloc verifyOtp: $e');
      _emitOneShot(
        emit,
        .errorMessage(otpVerified: _otpVerified, error: _messageOf(e)),
      );
    }
  }

  /// Auth errors already carry a translated message.
  String _messageOf(Object e) => e is AppException && e.message.isNotEmpty
      ? e.message
      : t.operation_not_allowed;
}
