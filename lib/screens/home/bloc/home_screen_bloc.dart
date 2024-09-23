import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:easy_birthday/core/general_functions.dart';
import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/models/category_model/category_enum.dart';
import 'package:easy_birthday/models/category_model/category_model.dart';
import 'package:easy_birthday/repos/event_repo.dart';
import 'package:easy_birthday/services/firebase/firestore_data.dart';
import 'package:meta/meta.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final EventRepo eventRepo;
  HomeScreenBloc({required this.eventRepo}) : super(HomeScreenInitial()) {
    on<HomeScreenEventAddButtonClicked>(_homeScreenEventAddButtonClicked);
    on<HomeScreenEventAddOrEditCategory>(_homeScreenEventAddNewCategory);
    on<HomeScreenEventUpdateCategoryInEvent>(
        _homeScreenEventUpdateCategoryInEvent);
    on<HomeScreenEventDeleteCategoryInEvent>(
        _homeScreenEventDeleteCategoryInEvent);
    on<HomeScreenEventUploadFilesInEvent>(_homeScreenEventUploadFilesInEvent);
    on<HomeScreenEventDeleteFilesInEvent>(_homeScreenEventDeleteFilesInEvent);
  }

  FutureOr<void> _homeScreenEventAddButtonClicked(
      HomeScreenEventAddButtonClicked event, Emitter<HomeScreenState> emit) {
    emit(HomeScreenStateOpenAddDialog());
  }

  FutureOr<void> _homeScreenEventAddNewCategory(
      HomeScreenEventAddOrEditCategory event,
      Emitter<HomeScreenState> emit) async {
    final newCategory = event.edit != true
        ? await eventRepo.addCategory(event.category)
        : event.category;
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
    eventRepo.updateCategory(event.category);
    emit(HomeScreenRefreshUI());
  }

  FutureOr<void> _homeScreenEventDeleteCategoryInEvent(
      HomeScreenEventDeleteCategoryInEvent event,
      Emitter<HomeScreenState> emit) {
    eventRepo.deleteCategory(event.category);
    emit(HomeScreenRefreshUI());
  }

  FutureOr<void> _homeScreenEventUploadFilesInEvent(
      HomeScreenEventUploadFilesInEvent event,
      Emitter<HomeScreenState> emit) async {
    emit(HomeScreenLoading(
        text: t.upload_files_count(file: "0", files: event.files.length)));
    final List<String> filesUrls = [];
    int count = 0;

    for (var file in event.files) {
      final fileUrl = await firestoreUploadMediaToStorage(
          path: "${globalEvent!.eventId}/${event.category.id}",
          file: file,
          fileName: getRandomString(5));
      filesUrls.add(fileUrl);
      count++;

      emit(HomeScreenLoading(
          text: t.upload_files_count(
              file: count.toString(), files: event.files.length)));
    }
    await Future.delayed(Duration(milliseconds: 500));
    List<String> updatesUrls = List<String>.from(event.category.urls ?? []);
    updatesUrls.addAll(filesUrls);
    eventRepo.updateCategory(event.category.copyWith(urls: updatesUrls));
    emit(HomeScreenRefreshUI());
  }

  Future<void> _homeScreenEventDeleteFilesInEvent(
      HomeScreenEventDeleteFilesInEvent event,
      Emitter<HomeScreenState> emit) async {
    final List<String> newUrls = List.from(event.category.urls!);

    for (int index in event.filesIndexes) {
      if (index >= 0 && index < newUrls.length) {
        firestoreRemoveFromStorageUrl(newUrls[index]);
        newUrls.removeAt(index);
      }
    }
    final newCategory = event.category.copyWith(urls: newUrls);
    eventRepo.updateCategory(newCategory);
    emit(HomeScreenRefreshUI());

    emit(HomeScreenOpenEditAgain(category: newCategory));
  }
}
