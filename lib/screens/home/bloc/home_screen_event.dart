part of 'home_screen_bloc.dart';

@immutable
abstract class HomeScreenEvent {}

class HomeScreenEventAddButtonClicked extends HomeScreenEvent {}

class HomeScreenEventAddNewCategory extends HomeScreenEvent {
  final CategoryModel category;

  HomeScreenEventAddNewCategory({required this.category});
}
