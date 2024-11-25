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
  final bool isWatch;

  LoginScreenEventOnVerification({
    required this.verificationId,
    required this.otpCode,
    required this.phoneNumber,
    required this.isWatch,
  });
}

class LoginScreenEventOnLoginButtonClick extends LoginScreenEvent {
  final String phoneNumber;
  final String password;
  final bool isWatch;

  LoginScreenEventOnLoginButtonClick({
    required this.phoneNumber,
    required this.password,
    required this.isWatch,
  });
}
