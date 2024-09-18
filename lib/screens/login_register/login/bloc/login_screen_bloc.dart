import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/models/persona_model/persona_model.dart';
import 'package:easy_birthday/models/persona_model/role_model.dart';
import 'package:easy_birthday/repos/persona_repo.dart';
import 'package:easy_birthday/services/encryption.dart';
import 'package:easy_birthday/services/firebase/error_translate_firebase.dart';
import 'package:easy_birthday/services/firebase/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_screen_event.dart';
part 'login_screen_state.dart';

class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  final PersonaRepo repo;

  LoginScreenBloc(this.repo) : super(LoginScreenInitial()) {
    on<LoginScreenEventNavToRegisterScreen>(
        _loginScreenEventNavToRegisterScreen);
    on<LoginScreenEventOnLoginButtonClick>(_loginScreenEventOnLoginButtonClick);
    on<LoginScreenEventOnSendCodeButtonClick>(
        _loginScreenEventOnSendCodeButtonClick);
  }

  FutureOr<void> _loginScreenEventNavToRegisterScreen(
      LoginScreenEventNavToRegisterScreen event,
      Emitter<LoginScreenState> emit) {
    emit(LoginScreenStateNaviRegister());
  }

  Future<void> _loginScreenEventOnLoginButtonClick(
      LoginScreenEventOnLoginButtonClick event,
      Emitter<LoginScreenState> emit) async {
    final personaExist =
        await repo.checkIfHaveDetails(phoneNumber: event.phoneNumber);
    if (personaExist) {
      final persona = await repo.getPersona(phoneNumber: event.phoneNumber);
      final firestorePassword =
          MyEncryptionDecryption.getStringFromEncrypted(persona.password);
      if (firestorePassword == event.password) {
        await repo.updatePersona(persona);
        loginToApp(persona, emit);
      } else {
        emit(LoginScreenStateDialogErrorMessage(message: t.wrong_password));
      }
    } else {
      emit(LoginScreenStateDialogErrorMessage(
          message: t.phone_not_exist_system));
    }
  }

  void loginToApp(PersonaModel persona, Emitter<LoginScreenState> emit) {
    if (!persona.role.isPartner()) {
      if (persona.registerComplete) {
        emit(LoginScreenStateNavToHomeScreen());
      } else {
        emit(LoginScreenStateNavToFirstRegisterScreen());
      }
    } else {
      if (persona.registerComplete) {
        emit(LoginScreenStateNavToHomeScreen());
      } else {
        emit(LoginScreenStateNavToFirstLoginScreen());
      }
    }
  }

  FutureOr<void> _loginScreenEventOnSendCodeButtonClick(
      LoginScreenEventOnSendCodeButtonClick event,
      Emitter<LoginScreenState> emit) async {
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
      // emit(LoginScreenStateNavToOtpScreen());
    } catch (e) {}
  }
}
