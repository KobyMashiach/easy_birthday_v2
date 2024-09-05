part of 'register_screen_bloc.dart';

@immutable
abstract class RegisterScreenEvent {}

class RegisterScreenEventNavToLoginScreen extends RegisterScreenEvent {}

class RegisterScreenEventOnRegisterButtonClick extends RegisterScreenEvent {
  final String phoneNumber;

  RegisterScreenEventOnRegisterButtonClick({required this.phoneNumber});
}

class RegisterScreenEventOnVerification extends RegisterScreenEvent {
  final String verificationId;
  final String otpCode;
  final String phoneNumber;
  final String password;
  RegisterScreenEventOnVerification(
      {required this.verificationId,
      required this.otpCode,
      required this.phoneNumber,
      required this.password});
}
