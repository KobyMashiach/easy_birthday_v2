import 'dart:async';

import 'package:easy_birthday/features/category_editor/domain/usecases/generate_greeting_usecase.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generate_greeting_bloc.freezed.dart';

@freezed
sealed class GenerateGreetingEvent with _$GenerateGreetingEvent {
  const factory GenerateGreetingEvent.generate(String prompt) = _Generate;
}

/// Identity equality: a repeated error must show again.
@Freezed(equal: false)
sealed class GenerateGreetingState with _$GenerateGreetingState {
  const factory GenerateGreetingState.initial({
    @Default('') String generatedText,
  }) = Initial;
  const factory GenerateGreetingState.loading({required String generatedText}) =
      Loading;
  const factory GenerateGreetingState.loaded({required String generatedText}) =
      Loaded;
  const factory GenerateGreetingState.errorMessage({
    required String generatedText,
    required String error,
  }) = ErrorMessage;
}

extension GenerateGreetingStateX on GenerateGreetingState {
  bool get isOneShot => this is ErrorMessage;
}

class GenerateGreetingBloc
    extends Bloc<GenerateGreetingEvent, GenerateGreetingState> {
  final GenerateGreetingUseCase generateGreetingUseCase;

  GenerateGreetingBloc({required this.generateGreetingUseCase})
    : super(const .initial()) {
    on<_Generate>(_generate);
  }

  factory GenerateGreetingBloc.fromContext(BuildContext context) =>
      GenerateGreetingBloc(
        generateGreetingUseCase: context.read<GenerateGreetingUseCase>(),
      );

  FutureOr<void> _generate(
    _Generate event,
    Emitter<GenerateGreetingState> emit,
  ) async {
    final String previous = state.generatedText;
    emit(.loading(generatedText: previous));
    try {
      final String text = await generateGreetingUseCase(event.prompt);
      emit(.loaded(generatedText: text));
    } catch (e) {
      debugPrint('Greeting generation failed: $e');
      // Leave the spinner first: the page doesn't build one-shot states.
      emit(.loaded(generatedText: previous));
      emit(.errorMessage(generatedText: previous, error: e.toString()));
    }
  }
}
