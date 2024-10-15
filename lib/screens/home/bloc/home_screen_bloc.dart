import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:easy_birthday/core/general_functions.dart';
import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/models/category_model/category_enum.dart';
import 'package:easy_birthday/models/category_model/category_model.dart';
import 'package:easy_birthday/repos/event_repo.dart';
import 'package:easy_birthday/services/firebase/firestore_data.dart';
import 'package:flutter/widgets.dart';

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
    on<HomeScreenEventUploadSupriseInEvent>(
        _homeScreenEventUploadSupriseInEvent);
  }

  FutureOr<void> _homeScreenEventAddButtonClicked(
      HomeScreenEventAddButtonClicked event, Emitter<HomeScreenState> emit) {
    emit(HomeScreenStateOpenAddDialog());
  }

  FutureOr<void> _homeScreenEventAddNewCategory(
      HomeScreenEventAddOrEditCategory event,
      Emitter<HomeScreenState> emit) async {
    final newCategory = event.edit != true
        ? eventRepo.addCategory(event.category)
        : event.category;
    switch (event.category.categoryType) {
      case CategoryEnum.text:
        emit(HomeScreenNavToAddText(category: newCategory));
      case CategoryEnum.pictures:
        emit(HomeScreenNavToAddPictures(category: newCategory));
      case CategoryEnum.videos:
        emit(HomeScreenNavToAddVideos(category: newCategory));
      case CategoryEnum.quizGame:
      case CategoryEnum.birthdayCalender:
      case CategoryEnum.birthdaySuprise:
        emit(HomeScreenNavToAddBirthdaySuprise(category: newCategory));
      // emit(HomeScreenNavToAddText());
    }
  }

  FutureOr<void> _homeScreenEventUpdateCategoryInEvent(
      HomeScreenEventUpdateCategoryInEvent event,
      Emitter<HomeScreenState> emit) async {
    emit(HomeScreenLoading());
    eventRepo.updateCategory(event.category);
    await Future.delayed(const Duration(milliseconds: 100));
    emit(HomeScreenRefreshUI());
  }

  FutureOr<void> _homeScreenEventDeleteCategoryInEvent(
      HomeScreenEventDeleteCategoryInEvent event,
      Emitter<HomeScreenState> emit) async {
    emit(HomeScreenLoading());
    eventRepo.deleteCategory(event.category);
    await Future.delayed(const Duration(milliseconds: 200));
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
    await Future.delayed(const Duration(milliseconds: 500));
    List<String> updatesUrls = List<String>.from(event.category.urls ?? []);
    updatesUrls.addAll(filesUrls);
    eventRepo.updateCategory(event.category.copyWith(urls: updatesUrls));

    emit(HomeScreenRefreshUI());
  }

  FutureOr<void> _homeScreenEventDeleteFilesInEvent(
      HomeScreenEventDeleteFilesInEvent event, Emitter<HomeScreenState> emit) {
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

  FutureOr<void> _homeScreenEventUploadSupriseInEvent(
      HomeScreenEventUploadSupriseInEvent event,
      Emitter<HomeScreenState> emit) async {
    Map<int, Map<String, String>> items = {};
    emit(HomeScreenLoading());
    for (int i = 0; i < event.widgets.length; i++) {
      emit(HomeScreenLoading(
          text: t.upload_files_count(file: i, files: event.widgets.length)));
      final currentWidget = event.widgets[i];
      if (currentWidget is Text) {
        if (currentWidget.style! == AppTextStyle().subTitle) {
          items[i] = {"title": currentWidget.data ?? ""};
        } else {
          items[i] = {"description": currentWidget.data ?? ""};
        }
      } else if (currentWidget is Image) {
        if (currentWidget.image is FileImage) {
          FileImage fileImage = currentWidget.image as FileImage;
          File file = fileImage.file;
          final fileUrl = await firestoreUploadMediaToStorage(
              path: "${globalEvent!.eventId}/${event.category.id}",
              file: file,
              fileName: getRandomString(5));
          items[i] = {"image": fileUrl};
        } else if (currentWidget.image is NetworkImage) {
          NetworkImage networkImage = currentWidget.image as NetworkImage;
          String path = networkImage.url;
          items[i] = {"image": path};
        }
      }
    }

    await Future.delayed(const Duration(milliseconds: 200));
    eventRepo.updateCategory(event.category.copyWith(supriseMap: items));

    emit(HomeScreenRefreshUI());
  }
}
