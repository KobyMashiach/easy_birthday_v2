import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/utils/routing/routing.dart';
import 'package:easy_birthday/features/category_display/presentation/category_display_routes.dart';
import 'package:easy_birthday/features/category_display/presentation/pages/display_birthday_calendar_page.dart';
import 'package:easy_birthday/features/category_display/presentation/pages/display_birthday_surprise_page.dart';
import 'package:easy_birthday/features/category_display/presentation/pages/display_memory_game_page.dart';
import 'package:easy_birthday/features/category_display/presentation/pages/display_pictures_videos_page.dart';
import 'package:easy_birthday/features/category_display/presentation/pages/display_quiz_game_page.dart';
import 'package:easy_birthday/features/category_display/presentation/pages/display_text_page.dart';
import 'package:easy_birthday/features/category_display/presentation/pages/display_wishes_list_page.dart';
import 'package:easy_birthday/features/category_display/presentation/widgets/dual_number_circular_progress.dart';
import 'package:easy_birthday/features/category_display/presentation/pages/done_quiz_page.dart';
import 'package:easy_birthday/features/category_display/presentation/widgets/quiz/quiz_widget.dart';
import 'package:easy_birthday/features/event/data/models/calendar_model.dart';
import 'package:easy_birthday/features/event/data/models/category_enum.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/features/event/data/models/date_event_model.dart';
import 'package:easy_birthday/features/event/data/models/memory_game_model.dart';
import 'package:easy_birthday/features/event/data/models/option_model.dart';
import 'package:easy_birthday/features/event/data/models/question_model.dart';
import 'package:easy_birthday/features/event/data/models/wishes_model.dart';
import 'package:easy_birthday/features/user/data/models/persona_model.dart';
import 'package:easy_birthday/features/user/data/models/role_model.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:table_calendar/table_calendar.dart';

CategoryModel _category(CategoryEnum type, {List<QuestionModel>? quiz}) =>
    CategoryModel(
      categoryType: type,
      name: type.name,
      description: '',
      titleAppear: 'Title ${type.name}',
      quizGame: quiz,
    );

QuestionModel _question({bool locked = false}) {
  final correct = OptionModel(text: 'Yes', isCorrect: true);
  return QuestionModel(
    text: 'Q?',
    options: [
      correct,
      OptionModel(text: 'No', isCorrect: false),
    ],
    isLocked: locked,
    selectedOption: locked ? correct : null,
  );
}

/// Phone-sized surface (the default 800x600 test view is shorter than the
/// devices these pages are laid out for).
void _usePhoneView(WidgetTester tester) {
  tester.view.physicalSize = const Size(1170, 2532);
  tester.view.devicePixelRatio = 3;
  addTearDown(tester.view.reset);
}

/// Pumps an app whose router holds only the category_display routes and
/// pushes [route] with [extra], exactly like the home partner view does.
Future<void> _push(WidgetTester tester, String route, Object extra) async {
  _usePhoneView(tester);
  final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (_, _) => const SizedBox()),
      GoRoute(path: Routing.home, builder: (_, _) => const Text('home')),
      ...categoryDisplayRoutes,
    ],
  );
  addTearDown(router.dispose);
  await tester.pumpWidget(MaterialApp.router(routerConfig: router));
  router.pushNamed(route, extra: extra);
  // Not pumpAndSettle: some pages loop confetti forever.
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 400));
}

void main() {
  setUp(() {
    SessionService().reset();
    SessionService().partner = PersonaModel(
      name: 'Dana',
      phoneNumber: '0500000000',
      password: '',
      role: RoleModel.owner,
      registerComplete: true,
    );
  });

  // Records below mirror home's partner_home_view call sites; a mismatch in
  // field names or function types makes the route's `as` cast throw.
  group('route extras match the contract', () {
    testWidgets('displayText', (tester) async {
      await _push(tester, Routing.displayText, (
        category: _category(CategoryEnum.text),
      ));
      expect(tester.takeException(), isNull);
      expect(find.byType(DisplayTextScreen), findsOneWidget);
    });

    testWidgets('displayPicturesVideos (images and videos)', (tester) async {
      for (final isImages in [true, false]) {
        await _push(tester, Routing.displayPicturesVideos, (
          category: _category(
            isImages ? CategoryEnum.pictures : CategoryEnum.videos,
          ),
          isImages: isImages,
        ));
        expect(tester.takeException(), isNull);
        expect(find.byType(DisplayPicturesVideosScreen), findsOneWidget);
      }
    });

    testWidgets('displayQuizGame', (tester) async {
      await _push(tester, Routing.displayQuizGame, (
        category: _category(CategoryEnum.quizGame),
        saveQuestion: (QuestionModel question, int index, int score) {},
      ));
      expect(tester.takeException(), isNull);
      expect(find.byType(DisplayQuizGame), findsOneWidget);
    });

    testWidgets('doneQuiz', (tester) async {
      final DoneQuizExtra extra = (score: 2, numOfQuestions: 3);
      await _push(tester, Routing.doneQuiz, extra);
      expect(tester.takeException(), isNull);
      expect(find.byType(DoneQuizScreen), findsOneWidget);
    });

    testWidgets('displayBirthdayCalendar', (tester) async {
      await _push(tester, Routing.displayBirthdayCalendar, (
        category: _category(CategoryEnum.birthdayCalendar),
      ));
      expect(tester.takeException(), isNull);
      expect(find.byType(DisplayBirthdayCalendar), findsOneWidget);
    });

    testWidgets('displayBirthdaySurprise', (tester) async {
      await _push(tester, Routing.displayBirthdaySurprise, (
        category: _category(CategoryEnum.birthdaySuprise),
      ));
      expect(tester.takeException(), isNull);
      expect(find.byType(DisplayBirthdaySurprise), findsOneWidget);
    });

    testWidgets('displayWishesList', (tester) async {
      void onChangeCategory(CategoryModel category) {}
      final category = _category(CategoryEnum.wishesList);
      await _push(tester, Routing.displayWishesList, (
        category: category,
        onDone: (WishesModel wishesList) =>
            onChangeCategory(category.copyWith(wishesList: wishesList)),
      ));
      expect(tester.takeException(), isNull);
      expect(find.byType(DisplayWishesList), findsOneWidget);
    });

    testWidgets('displayMemoryGame', (tester) async {
      await _push(tester, Routing.displayMemoryGame, (
        category: _category(CategoryEnum.memoryGame),
        onDone: (int score) {},
      ));
      expect(tester.takeException(), isNull);
      expect(find.byType(DisplayMemoryGame), findsOneWidget);
    });
  });

  group('quiz flow', () {
    testWidgets('answering the last question saves it and opens results', (
      tester,
    ) async {
      final saved = <(int, int)>[];
      await _push(tester, Routing.displayQuizGame, (
        category: _category(CategoryEnum.quizGame, quiz: [_question()]),
        saveQuestion: (QuestionModel question, int index, int score) {
          expect(question.isLocked, isTrue);
          saved.add((index, score));
        },
      ));
      await tester.tap(
        find.text(t.click_here_start(context: SessionService().gender)),
      );
      await tester.pump();
      expect(find.byType(QuizWidget), findsOneWidget);

      await tester.tap(find.text('Yes'));
      await tester.pump(const Duration(seconds: 1));
      await tester.pump(const Duration(milliseconds: 250));
      await tester.pump(const Duration(milliseconds: 400));

      expect(saved, [(0, 1)]);
      expect(find.byType(DoneQuizScreen), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('an already answered quiz goes straight to results', (
      tester,
    ) async {
      _usePhoneView(tester);
      final router = GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (_, _) => Scaffold(
              body: QuizWidget(
                questionsList: [_question(locked: true)],
                saveQuestion: (_, _, _) {},
                quizGameScore: 1,
              ),
            ),
          ),
          ...categoryDisplayRoutes,
        ],
      );
      addTearDown(router.dispose);
      await tester.pumpWidget(MaterialApp.router(routerConfig: router));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 400));
      expect(find.byType(DoneQuizScreen), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  });

  testWidgets('quiz answers are saved at once, a double tap only once', (
    tester,
  ) async {
    final saved = <(int, int)>[];
    await _push(tester, Routing.displayQuizGame, (
      category: _category(
        CategoryEnum.quizGame,
        quiz: [_question(), _question()],
      ),
      saveQuestion: (QuestionModel question, int index, int score) =>
          saved.add((index, score)),
    ));
    await tester.tap(
      find.text(t.click_here_start(context: SessionService().gender)),
    );
    await tester.pump();

    await tester.tap(find.text('Yes').first);
    await tester.tap(find.text('Yes').first, warnIfMissed: false);
    expect(saved, [(0, 1)]);

    await tester.pump(const Duration(seconds: 1));
    await tester.pump(const Duration(milliseconds: 400));
    await tester.tap(find.text('No').last);
    expect(saved, [(0, 1), (1, 1)]);
    await tester.pump(const Duration(seconds: 1));
    await tester.pump(const Duration(milliseconds: 250));
    await tester.pump(const Duration(milliseconds: 400));
    expect(find.byType(DoneQuizScreen), findsOneWidget);
  });

  testWidgets('surprise network images are shown cached and open full size', (
    tester,
  ) async {
    await _push(tester, Routing.displayBirthdaySurprise, (
      category: _category(CategoryEnum.birthdaySuprise).copyWith(
        surpriseMap: {
          0: {'title': 'Hello'},
          1: {'image': 'https://example.com/a.jpg'},
        },
      ),
    ));
    // It starts wrapped: open the gift first.
    await tester.tap(
      find.text(t.tap_to_open_gift(context: SessionService().gender)),
    );
    await tester.pump();
    await tester.pump(const Duration(seconds: 2));
    await tester.pump(const Duration(seconds: 1));
    expect(find.text('Hello'), findsOneWidget);
    expect(find.byType(CachedNetworkImage), findsOneWidget);
    await tester.tap(find.byType(CachedNetworkImage));
    await tester.pump();
    expect(find.byType(CachedNetworkImage), findsNWidgets(2));
  });

  testWidgets('a locked wish list with long texts does not overflow', (
    tester,
  ) async {
    final long = 'very long wish text ' * 4;
    await _push(tester, Routing.displayWishesList, (
      category: _category(CategoryEnum.wishesList).copyWith(
        wishesList: WishesModel(
          lock: true,
          first: long,
          second: long,
          third: long,
        ),
      ),
      onDone: (WishesModel wishesList) {},
    ));
    expect(tester.takeException(), isNull);
  });

  testWidgets('progress circle tolerates zero total', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: DualNumberCircularProgress(activeNumber: 0, totalNumber: 0),
      ),
    );
    expect(tester.takeException(), isNull);
  });

  group('content states', () {
    testWidgets('a calendar with a date range shows the month and events', (
      tester,
    ) async {
      await initializeDateFormatting();
      final start = DateTime.utc(2026, 3, 1);
      await _push(tester, Routing.displayBirthdayCalendar, (
        category: _category(CategoryEnum.birthdayCalendar).copyWith(
          calendarEvents: CalendarModel(
            startDate: start,
            endDate: DateTime.utc(2026, 3, 31),
          ),
        ),
      ));
      expect(tester.takeException(), isNull);
      expect(find.byType(TableCalendar<DateEventModel>), findsOneWidget);
      expect(find.text(t.nothing_here_yet), findsNothing);
    });

    testWidgets('categories without content show the empty screen', (
      tester,
    ) async {
      await _push(tester, Routing.displayBirthdayCalendar, (
        category: _category(CategoryEnum.birthdayCalendar),
      ));
      expect(find.text(t.nothing_here_yet), findsOneWidget);

      await _push(tester, Routing.displayMemoryGame, (
        category: _category(CategoryEnum.memoryGame),
        onDone: (int score) {},
      ));
      expect(find.text(t.nothing_here_yet), findsOneWidget);
    });

    testWidgets('leaving right after the last pair still saves the game', (
      tester,
    ) async {
      final scores = <int>[];
      await _push(tester, Routing.displayMemoryGame, (
        category: _category(CategoryEnum.memoryGame).copyWith(
          memoryGame: const MemoryGameModel(
            imagesUrls: ['https://example.com/a.jpg'],
            score: 0,
            lock: false,
          ),
        ),
        onDone: scores.add,
      ));
      // Wait for the initial reveal, then match the only pair.
      await tester.pump(const Duration(seconds: 3));
      final cards = find.byType(FlipCard);
      await tester.tap(cards.first);
      await tester.tap(cards.last);
      // Page closed before the 1s match check runs.
      await tester.pumpWidget(const SizedBox());
      await tester.pump(const Duration(seconds: 1));
      expect(scores, [1]);
    });

    testWidgets('a played memory game stays locked', (tester) async {
      await _push(tester, Routing.displayMemoryGame, (
        category: _category(CategoryEnum.memoryGame).copyWith(
          memoryGame: const MemoryGameModel(
            imagesUrls: ['https://example.com/a.jpg'],
            score: 1,
            lock: true,
          ),
        ),
        onDone: (int score) {},
      ));
      expect(find.text(t.memory_game_lock_title), findsOneWidget);
      // Let the initial "show all cards" delay finish.
      await tester.pump(const Duration(seconds: 3));
      expect(tester.takeException(), isNull);
    });
  });
}
