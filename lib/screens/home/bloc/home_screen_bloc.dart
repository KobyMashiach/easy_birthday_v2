import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:easy_birthday/models/category_model/category_enum.dart';
import 'package:easy_birthday/models/category_model/category_model.dart';
import 'package:easy_birthday/repos/event_repo.dart';
import 'package:meta/meta.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final EventRepo eventRepo;
  HomeScreenBloc({required this.eventRepo}) : super(HomeScreenInitial()) {
    on<HomeScreenEventAddButtonClicked>(_homeScreenEventAddButtonClicked);
    on<HomeScreenEventAddNewCategory>(_homeScreenEventAddNewCategory);
    on<HomeScreenEventUpdateCategoryInEvent>(
        _homeScreenEventUpdateCategoryInEvent);
  }

  FutureOr<void> _homeScreenEventAddButtonClicked(
      HomeScreenEventAddButtonClicked event, Emitter<HomeScreenState> emit) {
    emit(HomeScreenStateOpenAddDialog());
  }

  FutureOr<void> _homeScreenEventAddNewCategory(
      HomeScreenEventAddNewCategory event,
      Emitter<HomeScreenState> emit) async {
    final newCategory = await eventRepo.addCategory(event.category);
    switch (event.category.categoryType) {
      case CategoryEnum.text:
        emit(HomeScreenNavToAddText(category: newCategory));
      case CategoryEnum.pictures:
        emit(HomeScreenNavToAddPictures(category: newCategory));
      case CategoryEnum.videos:
        emit(HomeScreenNavToAddVideos(category: newCategory));
      case CategoryEnum.quizGame:
      // emit(HomeScreenNavToAddText());
    }
  }

  FutureOr<void> _homeScreenEventUpdateCategoryInEvent(
      HomeScreenEventUpdateCategoryInEvent event,
      Emitter<HomeScreenState> emit) async {
    await eventRepo.updateCategory(event.category);
  }
}
