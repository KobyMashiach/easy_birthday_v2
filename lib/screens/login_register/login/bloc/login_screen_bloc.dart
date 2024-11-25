import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/models/persona_model/persona_model.dart';
import 'package:easy_birthday/models/persona_model/role_model.dart';
import 'package:easy_birthday/repos/event_repo.dart';
import 'package:easy_birthday/repos/persona_repo.dart';
import 'package:easy_birthday/services/encryption.dart';
import 'package:easy_birthday/services/firebase/error_translate_firebase.dart';
import 'package:easy_birthday/services/firebase/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_screen_event.dart';
part 'login_screen_state.dart';

class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  final PersonaRepo repo;
  final EventRepo eventRepo;

  LoginScreenBloc(this.repo, this.eventRepo) : super(LoginScreenInitial()) {
    on<LoginScreenEventNavToRegisterScreen>(
        _loginScreenEventNavToRegisterScreen);
    on<LoginScreenEventOnLoginButtonClick>(_loginScreenEventOnLoginButtonClick);
    on<LoginScreenEventOnSendCodeButtonClick>(
        _loginScreenEventOnSendCodeButtonClick);
    on<LoginScreenEventOnVerification>(_loginScreenEventOnVerification);
  }

  FutureOr<void> _loginScreenEventNavToRegisterScreen(
      LoginScreenEventNavToRegisterScreen event,
      Emitter<LoginScreenState> emit) {
    emit(LoginScreenStateNaviRegister());
  }

  Future<void> _loginScreenEventOnLoginButtonClick(
      LoginScreenEventOnLoginButtonClick event,
      Emitter<LoginScreenState> emit) async {
    emit(LoginScreenLoading());
    final personaExist =
        await repo.checkIfHaveDetails(phoneNumber: event.phoneNumber);
    if (personaExist) {
      final persona = await repo.getPersona(phoneNumber: event.phoneNumber);
      final firestorePassword =
          MyEncryptionDecryption.getStringFromEncrypted(persona.password);
      if (firestorePassword == event.password) {
        await repo.updatePersona(persona);
        await loginToApp(persona, emit, event.isWatch);
      } else {
        emit(LoginScreenRefreshUI());
        emit(LoginScreenStateDialogErrorMessage(message: t.wrong_password));
      }
    } else {
      emit(LoginScreenRefreshUI());
      emit(LoginScreenStateDialogErrorMessage(
          message: t.phone_not_exist_system));
    }
  }

  FutureOr<void> _loginScreenEventOnSendCodeButtonClick(
      LoginScreenEventOnSendCodeButtonClick event,
      Emitter<LoginScreenState> emit) async {
    try {
      final personaExist =
          await repo.checkIfHaveDetails(phoneNumber: event.phoneNumber);
      String message = "";

      if (personaExist) {
        String verificationId = "";
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
        emit(LoginScreenLoading());
        await Future.any([
          Future.delayed(const Duration(seconds: 5)),
          Future.doWhile(() async {
            await Future.delayed(const Duration(milliseconds: 100));
            return verificationId == "";
          })
        ]);
        emit(LoginScreenRefreshUI());
        if (message != "") {
          log(message);
          emit(LoginScreenStateDialogErrorMessage(message: message));
        } else if (verificationId != "") {
          emit(LoginScreenStateNavToOtpScreen(verificationId: verificationId));
        } else {
          emit(LoginScreenStateDialogErrorMessage(
              message: t.operation_not_allowed));
        }
      } else {
        emit(LoginScreenStateDialogErrorMessage(
            message: t.phone_not_exist_system));
      }
    } catch (e) {
      log(e.toString());
    }
  }

  FutureOr<void> _loginScreenEventOnVerification(
      LoginScreenEventOnVerification event,
      Emitter<LoginScreenState> emit) async {
    final message = await signInWithOTP(event.verificationId, event.otpCode);
    if (message != "") {
      log(message);
      emit(LoginScreenStateDialogErrorMessage(message: message));
    } else {
      final persona = await repo.getPersona(phoneNumber: event.phoneNumber);
      await repo.updatePersona(persona);
      await loginToApp(persona, emit, event.isWatch);
    }
  }

  Future<void> loginToApp(PersonaModel persona, Emitter<LoginScreenState> emit,
      bool isWatch) async {
    globalEvent = await eventRepo.getEventFromServer();
    if (persona.role.isNotPartner()) {
      if (persona.registerComplete) {
        emit(isWatch
            ? LoginScreenStateMessageToWatch(message: "success")
            : LoginScreenStateNavToHomeScreen());
        emit(LoginScreenLoginWithWatch());
      } else {
        emit(isWatch
            ? LoginScreenStateMessageToWatch(message: "failed")
            : LoginScreenStateNavToFirstRegisterScreen());
        emit(LoginScreenRefreshUI());
      }
    } else {
      if (isWatch) {
        emit(LoginScreenStateMessageToWatch(message: "partner"));
        emit(LoginScreenRefreshUI());
      } else {
        final partnerPhone = globalEvent!.users
            .where((user) => user != globalUser.phoneNumber)
            .first;
        final partnerUser = await repo.getPersona(phoneNumber: partnerPhone);
        await repo.updatePartnerPersona(partnerUser);
        if (persona.registerComplete) {
          emit(LoginScreenStateNavToHomeScreen());
        } else {
          emit(LoginScreenStateNavToFirstLoginScreen());
        }
      }
    }
  }
}
