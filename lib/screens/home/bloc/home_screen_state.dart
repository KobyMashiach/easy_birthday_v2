part of 'home_screen_bloc.dart';

@immutable
abstract class HomeScreenState {}

final class HomeScreenInitial extends HomeScreenState {}

final class HomeScreenLoading extends HomeScreenState {
  final String? text;

  HomeScreenLoading({this.text});
}

final class HomeScreenRefreshUI extends HomeScreenState {}

@immutable
abstract class HomeScreenStateNavigate extends HomeScreenState {}

final class HomeScreenStateOpenAddDialog extends HomeScreenStateNavigate {}

final class HomeScreenNavToAddText extends HomeScreenStateNavigate {
  final CategoryModel category;

  HomeScreenNavToAddText({required this.category});
}

final class HomeScreenNavToAddPictures extends HomeScreenStateNavigate {
  final CategoryModel category;

  HomeScreenNavToAddPictures({required this.category});
}

final class HomeScreenNavToAddVideos extends HomeScreenStateNavigate {
  final CategoryModel category;

  HomeScreenNavToAddVideos({required this.category});
}

final class HomeScreenOpenEditAgain extends HomeScreenStateNavigate {
  final CategoryModel category;

  HomeScreenOpenEditAgain({required this.category});
}
