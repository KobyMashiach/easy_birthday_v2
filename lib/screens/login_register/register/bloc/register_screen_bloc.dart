import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:easy_birthday/repos/persona_repo.dart';
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
      final result = await repo.firstRegister(
          phoneNumber: event.phoneNumber, password: event.password);
      if (result == "exist") {
        emit(RegisterScreenStateDialogPhoneExist());
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
