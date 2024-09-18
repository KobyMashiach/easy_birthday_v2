import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/models/persona_model/role_model.dart';
import 'package:easy_birthday/repos/persona_repo.dart';
import 'package:easy_birthday/services/encryption.dart';
import 'package:meta/meta.dart';

part 'login_screen_event.dart';
part 'login_screen_state.dart';

class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  final PersonaRepo repo;

  LoginScreenBloc(this.repo) : super(LoginScreenInitial()) {
    on<LoginScreenEventNavToRegisterScreen>(
        _loginScreenEventNavToRegisterScreen);
    on<LoginScreenEventOnLoginButtonClick>(_loginScreenEventOnLoginButtonClick);
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
        if (persona.registerComplete) {
          emit(LoginScreenStateNavToHomeScreen());
        } else {
          if (!persona.role.isPartner()) {
            emit(LoginScreenStateNavToFirstRegisterScreen());
          } else {
            emit(LoginScreenStateNavToFirstLoginScreen());
          }
        }
      } else {
        emit(LoginScreenStateDialogErrorMessage(message: t.wrong_password));
      }
    } else {
      emit(LoginScreenStateDialogErrorMessage(
          message: t.phone_not_exist_system));
    }
  }
}
