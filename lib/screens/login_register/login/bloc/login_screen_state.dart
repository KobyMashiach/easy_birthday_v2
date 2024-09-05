part of 'login_screen_bloc.dart';

@immutable
abstract class LoginScreenState {}

final class LoginScreenInitial extends LoginScreenState {}

@immutable
abstract class LoginScreenStateNavi extends LoginScreenState {}

final class LoginScreenStateNaviRegister extends LoginScreenStateNavi {}

final class LoginScreenStateDialogErrorMessage extends LoginScreenStateNavi {
  final String message;

  LoginScreenStateDialogErrorMessage({required this.message});
}

final class LoginScreenStateNavToOtpScreen extends LoginScreenStateNavi {
  final String verificationId;

  LoginScreenStateNavToOtpScreen({required this.verificationId});
}

final class LoginScreenStateNavToHomeScreen extends LoginScreenStateNavi {}

final class LoginScreenStateNavToFirstRegisterScreen
    extends LoginScreenStateNavi {}
