import 'dart:async';
import 'dart:io';

import 'package:easy_birthday/core/errors/app_exception.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/features/event/data/models/question_model.dart';
import 'package:easy_birthday/features/event/domain/usecases/upload_media_usecase.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_quiz_game_bloc.freezed.dart';

@freezed
sealed class AddQuizGameEvent with _$AddQuizGameEvent {
  const factory AddQuizGameEvent.addQuestion(
    QuestionModel question,
    File? image,
  ) = _AddQuestion;
  const factory AddQuizGameEvent.removeQuestions(List<int> indexes) =
      _RemoveQuestions;
}

/// Identity equality: a repeated error must show again.
@Freezed(equal: false)
sealed class AddQuizGameState with _$AddQuizGameState {
  const factory AddQuizGameState.initial(List<QuestionModel> questions) =
      Initial;
  const factory AddQuizGameState.loading(List<QuestionModel> questions) =
      Loading;
  const factory AddQuizGameState.loaded(List<QuestionModel> questions) = Loaded;
  const factory AddQuizGameState.errorMessage(
    List<QuestionModel> questions,
    String error,
  ) = ErrorMessage;
}

extension AddQuizGameStateX on AddQuizGameState {
  bool get isOneShot => this is ErrorMessage;
}

class AddQuizGameBloc extends Bloc<AddQuizGameEvent, AddQuizGameState> {
  final UploadMediaUseCase uploadMediaUseCase;
  final CategoryModel category;

  AddQuizGameBloc({required this.uploadMediaUseCase, required this.category})
    : super(.initial(category.quizGame ?? [])) {
    on<_AddQuestion>(_addQuestion);
    on<_RemoveQuestions>(_removeQuestions);
  }

  factory AddQuizGameBloc.fromContext(
    BuildContext context, {
    required CategoryModel category,
  }) => AddQuizGameBloc(
    uploadMediaUseCase: context.read<UploadMediaUseCase>(),
    category: category,
  );

  FutureOr<void> _addQuestion(
    _AddQuestion event,
    Emitter<AddQuizGameState> emit,
  ) async {
    final List<QuestionModel> questions = state.questions;
    emit(.loading(questions));
    try {
      String? fileUrl;
      if (event.image case final File image) {
        final String eventId =
            SessionService().event?.eventId ??
            (throw const AppException(
              AppErrorType.notFound,
              message: 'No event loaded',
            ));
        fileUrl = await uploadMediaUseCase(
          folder: "$eventId/${category.id}",
          file: image,
        );
      }
      emit(.loaded([...questions, event.question.copyWith(imageUrl: fileUrl)]));
    } catch (e) {
      debugPrint('Failed adding question: $e');
      // Leave the spinner first: the page doesn't build one-shot states.
      emit(.loaded(questions));
      emit(.errorMessage(questions, e.toString()));
    }
  }

  FutureOr<void> _removeQuestions(
    _RemoveQuestions event,
    Emitter<AddQuizGameState> emit,
  ) {
    final List<QuestionModel> questions = state.questions;
    final List<QuestionModel> modifiableList = List.from(questions);
    final List<int> indexes = event.indexes.toSet().toList()
      ..sort((a, b) => b.compareTo(a));
    for (final int index in indexes) {
      if (index >= 0 && index < questions.length) {
        modifiableList.removeAt(index);
      }
    }
    emit(.loaded(modifiableList));
  }
}
