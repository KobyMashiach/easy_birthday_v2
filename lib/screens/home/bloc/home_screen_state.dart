part of 'home_screen_bloc.dart';

@immutable
abstract class HomeScreenState {}

final class HomeScreenInitial extends HomeScreenState {}

final class HomeScreenLoading extends HomeScreenState {}

final class HomeScreenRefreshUI extends HomeScreenState {}

@immutable
abstract class HomeScreenStateNavigate extends HomeScreenState {}

final class HomeScreenStateOpenAddDialog extends HomeScreenStateNavigate {}
