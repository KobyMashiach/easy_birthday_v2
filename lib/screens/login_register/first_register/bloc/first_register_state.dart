part of 'first_register_bloc.dart';

@immutable
abstract class FirstRegisterState {
  final PlanModel planModel;

  const FirstRegisterState({required this.planModel});
}

final class FirstRegisterInitial extends FirstRegisterState {
  const FirstRegisterInitial({required super.planModel});
}

final class FirstRegisterRefreshUI extends FirstRegisterState {
  const FirstRegisterRefreshUI({required super.planModel});
}

@immutable
abstract class FirstRegisterStateNav extends FirstRegisterState {
  const FirstRegisterStateNav({required super.planModel});
}

final class FirstRegisterStateNavHomeScreen extends FirstRegisterStateNav {
  const FirstRegisterStateNavHomeScreen({required super.planModel});
}
