part of 'login_screen_bloc.dart';

@immutable
abstract class LoginScreenEvent {}

class LoginScreenEventNavToRegisterScreen extends LoginScreenEvent {}

class LoginScreenEventOnSendCodeButtonClick extends LoginScreenEvent {
  final String phoneNumber;

  LoginScreenEventOnSendCodeButtonClick({required this.phoneNumber});
}

class LoginScreenEventOnVerification extends LoginScreenEvent {
  final String verificationId;
  final String otpCode;
  final String phoneNumber;
  final String password;

  LoginScreenEventOnVerification(
      {required this.verificationId,
      required this.otpCode,
      required this.phoneNumber,
      required this.password});
}

class LoginScreenEventOnLoginButtonClick extends LoginScreenEvent {
  final String phoneNumber;
  final String password;

  LoginScreenEventOnLoginButtonClick(
      {required this.phoneNumber, required this.password});
}
