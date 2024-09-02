part of 'register_screen_bloc.dart';

@immutable
abstract class RegisterScreenEvent {}

class RegisterScreenEventNavToLoginScreen extends RegisterScreenEvent {}

class RegisterScreenEventOnRegisterButtonClick extends RegisterScreenEvent {
  final String phoneNumber;
  final String password;

  RegisterScreenEventOnRegisterButtonClick(
      {required this.phoneNumber, required this.password});
}

class RegisterScreenEventOnVerification extends RegisterScreenEvent {
  final String verificationId;
  final String otpCode;
  RegisterScreenEventOnVerification(
      {required this.verificationId, required this.otpCode});
}
