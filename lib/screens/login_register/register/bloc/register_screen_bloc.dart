import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/repos/persona_repo.dart';
import 'package:easy_birthday/services/firebase/error_translate_firebase.dart';
import 'package:easy_birthday/services/firebase/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'register_screen_event.dart';
part 'register_screen_state.dart';

class RegisterScreenBloc
    extends Bloc<RegisterScreenEvent, RegisterScreenState> {
  final PersonaRepo repo;
  RegisterScreenBloc(this.repo) : super(RegisterScreenInitial()) {
    on<RegisterScreenEventNavToLoginScreen>(
        _registerScreenEventNavToLoginScreen);
    on<RegisterScreenEventOnRegisterButtonClick>(
        _registerScreenEventOnRegisterButtonClick);
    on<RegisterScreenEventOnVerification>(_registerScreenEventOnVerification);
  }

  FutureOr<void> _registerScreenEventNavToLoginScreen(
      RegisterScreenEventNavToLoginScreen event,
      Emitter<RegisterScreenState> emit) {
    emit(RegisterScreenStateNaviLogin());
  }

  FutureOr<void> _registerScreenEventOnRegisterButtonClick(
      RegisterScreenEventOnRegisterButtonClick event,
      Emitter<RegisterScreenState> emit) async {
    try {
      String verificationId = "";
      String message = "";

      await verifyPhoneNumber(
        event.phoneNumber,
        (phoneAuthCredential) => log("credential: $phoneAuthCredential"),
        (error) {
          message = getMessageFromErrorCode(error.code);
          log("e: ${error.code}");
        },
        (verificationIdGet, forceResendingToken) {
          log("str: $verificationIdGet\nnumber: $forceResendingToken");
          verificationId = verificationIdGet;
        },
        (timeout) => log("timeout: $timeout"),
      );
      emit(RegisterScreenLoading());
      await Future.any([
        Future.delayed(Duration(seconds: 5)),
        Future.doWhile(() async {
          await Future.delayed(Duration(milliseconds: 100));
          return verificationId == "";
        })
      ]);
      emit(RegisterScreenRefreshUI());
      if (message != "") {
        log(message);
        emit(RegisterScreenStateDialogErrorRegister(message: message));
      } else if (verificationId != "") {
        emit(RegisterScreenStateNavToOtpScreen(verificationId: verificationId));
      } else {
        emit(RegisterScreenStateDialogErrorRegister(
            message: t.operation_not_allowed));
      }
    } catch (e) {
      log(e.toString());
    }
  }

  FutureOr<void> _registerScreenEventOnVerification(
      RegisterScreenEventOnVerification event,
      Emitter<RegisterScreenState> emit) async {
    final message = await signInWithOTP(event.verificationId, event.otpCode);
    if (message != "") {
      log(message);
      emit(RegisterScreenStateDialogErrorRegister(message: message));
    } else {
      repo.firstRegister(
          phoneNumber: event.phoneNumber, password: event.password);
      emit(RegisterScreenStateNavToFirstRegister());
    }
  }
}
