part of 'home_screen_bloc.dart';

@immutable
abstract class HomeScreenEvent {}

class HomeScreenEventAddButtonClicked extends HomeScreenEvent {}

class HomeScreenEventAddOrEditCategory extends HomeScreenEvent {
  final CategoryModel category;
  final bool? edit;

  HomeScreenEventAddOrEditCategory({required this.category, this.edit});
}

class HomeScreenEventUpdateCategoryInEvent extends HomeScreenEvent {
  final CategoryModel category;

  HomeScreenEventUpdateCategoryInEvent({required this.category});
}

class HomeScreenEventDeleteCategoryInEvent extends HomeScreenEvent {
  final CategoryModel category;

  HomeScreenEventDeleteCategoryInEvent({required this.category});
}

class HomeScreenEventUploadFilesInEvent extends HomeScreenEvent {
  final CategoryModel category;
  final List<File> files;

  HomeScreenEventUploadFilesInEvent(
      {required this.category, required this.files});
}

class HomeScreenEventDeleteFilesInEvent extends HomeScreenEvent {
  final CategoryModel category;
  final List<int> filesIndexes;

  HomeScreenEventDeleteFilesInEvent(
      {required this.category, required this.filesIndexes});
}
