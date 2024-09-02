import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:easy_birthday/repos/persona_repo.dart';
import 'package:meta/meta.dart';

part 'login_screen_event.dart';
part 'login_screen_state.dart';

class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  final PersonaRepo repo;

  LoginScreenBloc(this.repo) : super(LoginScreenInitial()) {
    on<RegisterScreenEventNavToRegisterScreen>(
        _registerScreenEventNavToRegisterScreen);
  }

  FutureOr<void> _registerScreenEventNavToRegisterScreen(
      RegisterScreenEventNavToRegisterScreen event,
      Emitter<LoginScreenState> emit) {
    emit(LoginScreenStateNaviRegister());
  }
}
