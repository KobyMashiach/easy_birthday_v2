import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/core/hive/general_data_source.dart';
import 'package:easy_birthday/models/category_model/category_model.dart';
import 'package:easy_birthday/repos/event_repo.dart';
import 'package:meta/meta.dart';

part 'wear_os_categories_event.dart';
part 'wear_os_categories_state.dart';

class WearOsCategoriesBloc
    extends Bloc<WearOsCategoriesEvent, WearOsCategoriesState> {
  final EventRepo eventRepo;
  final GeneralDataSource generalDataSource;

  WearOsCategoriesBloc(
      {required this.eventRepo, required this.generalDataSource})
      : super(WearOsCategoriesInitial()) {
    on<WearOsCategoriesEventInit>(_wearOsCategoriesEventInit);
    on<WearOsCategoriesEventOnLockPress>(_wearOsCategoriesEventOnLockPress);
  }

  FutureOr<void> _wearOsCategoriesEventInit(WearOsCategoriesEventInit event,
      Emitter<WearOsCategoriesState> emit) async {
    globalEvent = await eventRepo.getEventFromServer(event.eventId);
    generalDataSource.saveEventId(eventId: event.eventId);
  }

  FutureOr<void> _wearOsCategoriesEventOnLockPress(
      WearOsCategoriesEventOnLockPress event,
      Emitter<WearOsCategoriesState> emit) {
    final categoryLock = event.category.lock;
    eventRepo.updateCategory(event.category.copyWith(lock: !categoryLock));
  }
}
