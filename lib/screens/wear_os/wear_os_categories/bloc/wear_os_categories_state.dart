part of 'wear_os_categories_bloc.dart';

@immutable
abstract class WearOsCategoriesState {}

final class WearOsCategoriesInitial extends WearOsCategoriesState {}

abstract class WearOsCategoriesNavigate extends WearOsCategoriesState {}

final class WearOsCategoriesOnLogout extends WearOsCategoriesNavigate {}
