import 'dart:async';

import 'package:bloc/bloc.dart';
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
  }

  FutureOr<void> _homeScreenEventAddButtonClicked(
      HomeScreenEventAddButtonClicked event, Emitter<HomeScreenState> emit) {
    emit(HomeScreenStateOpenAddDialog());
  }

  FutureOr<void> _homeScreenEventAddNewCategory(
      HomeScreenEventAddNewCategory event,
      Emitter<HomeScreenState> emit) async {
    await eventRepo.addCategory(event.category);
  }
}
