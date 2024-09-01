part of 'register_screen_bloc.dart';

@immutable
abstract class RegisterScreenState {}

final class RegisterScreenInitial extends RegisterScreenState {}

@immutable
abstract class RegisterScreenStateNavi extends RegisterScreenState {}

final class RegisterScreenStateNaviLogin extends RegisterScreenStateNavi {}

final class RegisterScreenStateDialogPhoneExist
    extends RegisterScreenStateNavi {}
