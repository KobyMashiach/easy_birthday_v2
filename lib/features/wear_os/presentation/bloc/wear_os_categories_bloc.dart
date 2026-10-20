import 'dart:async';

import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/features/event/data/models/event_model.dart';
import 'package:easy_birthday/features/event/domain/usecases/get_event_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/update_category_usecase.dart';
import 'package:easy_birthday/features/wear_os/domain/usecases/clear_event_id_usecase.dart';
import 'package:easy_birthday/features/wear_os/domain/usecases/save_event_id_usecase.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wear_os_categories_bloc.freezed.dart';

@freezed
sealed class WearOsCategoriesEvent with _$WearOsCategoriesEvent {
  const factory WearOsCategoriesEvent.init(String eventId) = _Init;
  const factory WearOsCategoriesEvent.setLock(
    CategoryModel category, {
    required bool lock,
  }) = _SetLock;
  const factory WearOsCategoriesEvent.logout() = _Logout;
}

@Freezed(equal: false)
sealed class WearOsCategoriesState with _$WearOsCategoriesState {
  const factory WearOsCategoriesState.initial(EventModel? event) = Initial;
  const factory WearOsCategoriesState.loading(EventModel? event) = Loading;
  const factory WearOsCategoriesState.loaded(EventModel? event) = Loaded;

  /// The event couldn't be loaded when the page opened.
  const factory WearOsCategoriesState.loadFailed(EventModel? event) =
      LoadFailed;
  const factory WearOsCategoriesState.errorMessage(
    EventModel? event,
    String error,
  ) = ErrorMessage;
  const factory WearOsCategoriesState.navigateToLogin(EventModel? event) =
      NavigateToLogin;
}

extension WearOsCategoriesStateX on WearOsCategoriesState {
  bool get isOneShot => switch (this) {
    Initial() || Loading() || Loaded() || LoadFailed() => false,
    ErrorMessage() || NavigateToLogin() => true,
  };
}

class WearOsCategoriesBloc
    extends Bloc<WearOsCategoriesEvent, WearOsCategoriesState> {
  final GetEventUseCase getEventUseCase;
  final UpdateCategoryUseCase updateCategoryUseCase;
  final SaveEventIdUseCase saveEventIdUseCase;
  final ClearEventIdUseCase clearEventIdUseCase;

  WearOsCategoriesBloc({
    required this.getEventUseCase,
    required this.updateCategoryUseCase,
    required this.saveEventIdUseCase,
    required this.clearEventIdUseCase,
  }) : super(.initial(SessionService().event)) {
    on<_Init>(_init);
    // One at a time, in tap order: a quick lock + unlock must end unlocked.
    on<_SetLock>(
      _setLock,
      transformer: (events, mapper) => events.asyncExpand(mapper),
    );
    on<_Logout>(_logout);
  }

  factory WearOsCategoriesBloc.fromContext(BuildContext context) =>
      WearOsCategoriesBloc(
        getEventUseCase: context.read<GetEventUseCase>(),
        updateCategoryUseCase: context.read<UpdateCategoryUseCase>(),
        saveEventIdUseCase: context.read<SaveEventIdUseCase>(),
        clearEventIdUseCase: context.read<ClearEventIdUseCase>(),
      );

  FutureOr<void> _init(_Init event, Emitter<WearOsCategoriesState> emit) async {
    emit(.loading(state.event));
    try {
      // The id came from the phone's approved login: keep it even if this
      // first load fails (offline), so the next launch retries it.
      await saveEventIdUseCase(event.eventId);
      final loaded = await getEventUseCase(event.eventId);
      if (loaded == null) {
        throw StateError('Event ${event.eventId} not found');
      }
      SessionService().event = loaded;
      emit(.loaded(loaded));
    } catch (e) {
      debugPrint('WearOsCategoriesBloc init failed: $e');
      emit(.loadFailed(state.event));
    }
  }

  FutureOr<void> _setLock(
    _SetLock event,
    Emitter<WearOsCategoriesState> emit,
  ) async {
    try {
      // Applied to the latest saved copy, so the owner's newer edits of this
      // category (made since the watch opened it) are kept.
      await updateCategoryUseCase(
        event.category,
        (latest) => latest.copyWith(lock: event.lock),
      );
      emit(.loaded(SessionService().event));
    } catch (e) {
      debugPrint('WearOsCategoriesBloc setLock failed: $e');
      emit(.errorMessage(SessionService().event, e.toString()));
      // Rebuilds the cards with the saved value (undoes the optimistic toggle).
      emit(.loaded(SessionService().event));
    }
  }

  FutureOr<void> _logout(
    _Logout event,
    Emitter<WearOsCategoriesState> emit,
  ) async {
    try {
      await clearEventIdUseCase();
    } catch (e) {
      // Still leave: the watch is signed out for this session either way.
      debugPrint('WearOsCategoriesBloc logout failed: $e');
      emit(.errorMessage(state.event, e.toString()));
    }
    emit(.navigateToLogin(state.event));
  }
}
