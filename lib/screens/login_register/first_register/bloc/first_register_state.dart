part of 'first_register_bloc.dart';

@immutable
abstract class FirstRegisterState {
  final PlanModel planModel;

  FirstRegisterState({required this.planModel});
}

final class FirstRegisterInitial extends FirstRegisterState {
  FirstRegisterInitial({required super.planModel});
}

final class FirstRegisterRefreshUI extends FirstRegisterState {
  FirstRegisterRefreshUI({required super.planModel});
}
