part of 'register_screen_bloc.dart';

@immutable
abstract class RegisterScreenState {}

final class RegisterScreenInitial extends RegisterScreenState {}

@immutable
abstract class RegisterScreenStateNavi extends RegisterScreenState {}

final class RegisterScreenStateNaviLogin extends RegisterScreenStateNavi {}

final class RegisterScreenStateDialogPhoneExist
    extends RegisterScreenStateNavi {}

final class RegisterScreenStateDialogErrorRegister
    extends RegisterScreenStateNavi {
  final String message;

  RegisterScreenStateDialogErrorRegister({required this.message});
}

final class RegisterScreenStateNavToOtpScreen extends RegisterScreenStateNavi {
  final String verificationId;

  RegisterScreenStateNavToOtpScreen({required this.verificationId});
}

final class RegisterScreenStateNavToHomeScreen
    extends RegisterScreenStateNavi {}
