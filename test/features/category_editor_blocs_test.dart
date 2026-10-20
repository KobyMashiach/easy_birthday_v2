import 'dart:io';

import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/features/category_editor/domain/repositories/greeting_repository.dart';
import 'package:easy_birthday/features/category_editor/domain/usecases/generate_greeting_usecase.dart';
import 'package:easy_birthday/features/category_editor/presentation/bloc/add_quiz_game_bloc.dart'
    as quiz;
import 'package:easy_birthday/features/category_editor/presentation/bloc/generate_greeting_bloc.dart'
    as greeting;
import 'package:easy_birthday/features/event/data/models/category_enum.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/features/event/data/models/event_model.dart';
import 'package:easy_birthday/features/event/data/models/option_model.dart';
import 'package:easy_birthday/features/event/data/models/plan_model.dart';
import 'package:easy_birthday/features/event/data/models/question_model.dart';
import 'package:easy_birthday/features/event/domain/usecases/upload_media_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/fakes.dart';

class _FakeGreetingRepository implements GreetingRepository {
  Object? error;
  @override
  Future<String> generateGreeting(String prompt) async {
    if (error != null) throw error!;
    return 'greeting for $prompt';
  }
}

QuestionModel _question(String text) => QuestionModel(
  text: text,
  options: [OptionModel(text: 'a', isCorrect: true)],
);

void main() {
  group('GenerateGreetingBloc', () {
    test('emits loading then loaded with the generated text', () async {
      final bloc = greeting.GenerateGreetingBloc(
        generateGreetingUseCase: GenerateGreetingUseCase(
          _FakeGreetingRepository(),
        ),
      );
      addTearDown(bloc.close);
      final states = await emittedStates(
        bloc,
        () => bloc.add(const greeting.GenerateGreetingEvent.generate('mom')),
      );
      expect(states.map((s) => s.runtimeType), [
        greeting.Loading,
        greeting.Loaded,
      ]);
      expect(states.last.generatedText, 'greeting for mom');
    });

    test('a failure keeps the previous text and reports the error', () async {
      final repository = _FakeGreetingRepository();
      final bloc = greeting.GenerateGreetingBloc(
        generateGreetingUseCase: GenerateGreetingUseCase(repository),
      );
      addTearDown(bloc.close);
      await emittedStates(
        bloc,
        () => bloc.add(const greeting.GenerateGreetingEvent.generate('dad')),
      );
      repository.error = Exception('offline');
      final states = await emittedStates(
        bloc,
        () => bloc.add(const greeting.GenerateGreetingEvent.generate('again')),
      );
      expect(states.last, isA<greeting.ErrorMessage>());
      expect(states.last.generatedText, 'greeting for dad');
      // The page builds only non-one-shot states: the spinner must end first.
      expect(states[states.length - 2], isA<greeting.Loaded>());
      expect(states.last.isOneShot, isTrue);

      // The same failure again is reported again (identity equality).
      final again = await emittedStates(
        bloc,
        () => bloc.add(const greeting.GenerateGreetingEvent.generate('again')),
      );
      expect(again.whereType<greeting.ErrorMessage>(), hasLength(1));
    });
  });

  group('AddQuizGameBloc', () {
    late FakeEventRepository events;
    late quiz.AddQuizGameBloc bloc;

    setUp(() {
      events = FakeEventRepository();
      bloc = quiz.AddQuizGameBloc(
        uploadMediaUseCase: UploadMediaUseCase(events),
        category: CategoryModel(
          categoryType: CategoryEnum.quizGame,
          id: 'c1',
          name: 'quiz',
          description: '',
          quizGame: [_question('q0'), _question('q1'), _question('q2')],
        ),
      );
    });
    tearDown(() async {
      await bloc.close();
      SessionService().reset();
    });

    test('adding a question without an image skips the upload', () async {
      final states = await emittedStates(
        bloc,
        () =>
            bloc.add(quiz.AddQuizGameEvent.addQuestion(_question('q3'), null)),
      );
      expect(events.log, isEmpty);
      expect(states.first, isA<quiz.Loading>());
      expect(states.last, isA<quiz.Loaded>());
      expect(states.last.questions.map((q) => q.text), [
        'q0',
        'q1',
        'q2',
        'q3',
      ]);
    });

    test('an image is uploaded to the event/category folder', () async {
      SessionService().event = EventModel(
        eventId: 'e1',
        users: const ['1', '2'],
        planSubscribe: getPlan(PlansEnum.free),
      );
      final states = await emittedStates(
        bloc,
        () => bloc.add(
          quiz.AddQuizGameEvent.addQuestion(_question('q3'), File('/a.jpg')),
        ),
      );
      expect(events.log, ['upload:/a.jpg']);
      expect(states.last, isA<quiz.Loaded>());
      expect(states.last.questions.last.imageUrl, 'https://cdn/e1/c1/a.jpg');
    });

    test('a failed upload keeps the questions and reports it', () async {
      SessionService().event = EventModel(
        eventId: 'e1',
        users: const ['1', '2'],
        planSubscribe: getPlan(PlansEnum.free),
      );
      events.failUploadsContaining = 'a.jpg';
      final states = await emittedStates(
        bloc,
        () => bloc.add(
          quiz.AddQuizGameEvent.addQuestion(_question('q3'), File('/a.jpg')),
        ),
      );
      expect(states.map((s) => s.runtimeType), [
        quiz.Loading,
        quiz.Loaded,
        quiz.ErrorMessage,
      ]);
      expect(states.last.isOneShot, isTrue);
      expect(states.last.questions, hasLength(3));
    });

    test('removing questions ignores bad indexes and order', () async {
      final states = await emittedStates(
        bloc,
        () => bloc.add(
          const quiz.AddQuizGameEvent.removeQuestions([0, 7, 2, -1]),
        ),
      );
      expect(states.single.questions.map((q) => q.text), ['q1']);
    });
  });
}
