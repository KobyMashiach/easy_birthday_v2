import 'dart:async';

import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/features/event/data/models/child_model.dart';
import 'package:easy_birthday/features/event/domain/usecases/update_children_usecase.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'children_bloc.freezed.dart';

@freezed
sealed class ChildrenEvent with _$ChildrenEvent {
  /// Adds [child], or replaces the child with its id.
  const factory ChildrenEvent.saveChild(ChildModel child) = _SaveChild;
  const factory ChildrenEvent.deleteChild(ChildModel child) = _DeleteChild;
}

@Freezed(equal: false)
sealed class ChildrenState with _$ChildrenState {
  const factory ChildrenState.loaded(List<ChildModel> children) = Loaded;
  const factory ChildrenState.saving(List<ChildModel> children) = Saving;

  /// The save failed; [children] is the list as it is still saved.
  const factory ChildrenState.errorMessage(List<ChildModel> children) =
      ErrorMessage;
}

extension ChildrenStateX on ChildrenState {
  bool get isOneShot => this is ErrorMessage;
}

class ChildrenBloc extends Bloc<ChildrenEvent, ChildrenState> {
  final UpdateChildrenUseCase updateChildrenUseCase;

  ChildrenBloc({required this.updateChildrenUseCase})
    : super(.loaded(SessionService().event?.children ?? const [])) {
    on<_SaveChild>(_saveChild);
    on<_DeleteChild>(_deleteChild);
  }

  factory ChildrenBloc.fromContext(BuildContext context) => ChildrenBloc(
    updateChildrenUseCase: context.read<UpdateChildrenUseCase>(),
  );

  List<ChildModel> get _saved => SessionService().event?.children ?? const [];

  FutureOr<void> _saveChild(_SaveChild event, Emitter<ChildrenState> emit) {
    final List<ChildModel> current = _saved;
    final bool exists = current.any((child) => child.id == event.child.id);
    return _write(emit, [
      for (final child in current)
        child.id == event.child.id ? event.child : child,
      if (!exists) event.child,
    ]);
  }

  FutureOr<void> _deleteChild(
    _DeleteChild event,
    Emitter<ChildrenState> emit,
  ) => _write(emit, [
    for (final child in _saved)
      if (child.id != event.child.id) child,
  ]);

  Future<void> _write(
    Emitter<ChildrenState> emit,
    List<ChildModel> children,
  ) async {
    emit(.saving(children));
    try {
      await updateChildrenUseCase(children);
      emit(.loaded(_saved));
    } catch (e) {
      debugPrint('ChildrenBloc save failed: $e');
      emit(.loaded(_saved));
      emit(.errorMessage(_saved));
    }
  }
}
