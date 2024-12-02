part of 'wear_os_categories_bloc.dart';

@immutable
abstract class WearOsCategoriesEvent {}

class WearOsCategoriesEventInit extends WearOsCategoriesEvent {
  final String eventId;

  WearOsCategoriesEventInit({required this.eventId});
}

class WearOsCategoriesEventOnLockPress extends WearOsCategoriesEvent {
  final CategoryModel category;

  WearOsCategoriesEventOnLockPress({required this.category});
}

class WearOsCategoriesEventOnLogout extends WearOsCategoriesEvent {}
