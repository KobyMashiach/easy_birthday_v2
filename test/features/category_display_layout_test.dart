import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/utils/routing/routing.dart';
import 'package:easy_birthday/features/category_display/presentation/category_display_routes.dart';
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
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/date_symbol_data_local.dart';

/// Worst realistic case for the partner: a small phone (360x640 dp, also
/// turned to landscape), the largest text scale the app allows (1.6, see
/// main.dart) and long owner-written content, in both languages.
const _sizes = {
  'portrait': Size(360, 640),
  'landscape': Size(640, 360),
};

final String _longText = 'A long line written by the owner. ' * 12;
const String _longTitle = 'A very long category title for the partner';

CategoryModel _category(CategoryEnum type) => CategoryModel(
  categoryType: type,
  name: type.name,
  description: '',
  titleAppear: _longTitle,
);

QuestionModel _question({bool withImage = true}) => QuestionModel(
  text: 'What did we eat on our very first date, back then?',
  imageUrl: withImage ? 'https://example.com/q.jpg' : null,
  options: [
    for (var i = 0; i < 4; i++)
      OptionModel(text: 'A long possible answer $i', isCorrect: i == 0),
  ],
);

List<String> _urls(int count) => [
  for (var i = 0; i < count; i++) 'https://example.com/$i.jpg',
];

/// Every display route with content that stresses its layout.
Map<String, (String, Object)> _pages() {
  final start = DateTime.utc(2026, 3, 1);
  return {
    'text': (
      Routing.displayText,
      (category: _category(CategoryEnum.text).copyWith(text: _longText)),
    ),
    'text empty': (
      Routing.displayText,
      (category: _category(CategoryEnum.text)),
    ),
    'pictures': (
      Routing.displayPicturesVideos,
      (
        category: _category(CategoryEnum.pictures).copyWith(urls: _urls(40)),
        isImages: true,
      ),
    ),
    'quiz start': (
      Routing.displayQuizGame,
      (
        category: _category(
          CategoryEnum.quizGame,
        ).copyWith(quizGame: [_question(), _question()]),
        saveQuestion: (QuestionModel question, int index, int score) {},
      ),
    ),
    'quiz without questions': (
      Routing.displayQuizGame,
      (
        category: _category(CategoryEnum.quizGame),
        saveQuestion: (QuestionModel question, int index, int score) {},
      ),
    ),
    'done quiz': (
      Routing.doneQuiz,
      (score: 7, numOfQuestions: 10),
    ),
    'calendar': (
      Routing.displayBirthdayCalendar,
      (
        category: _category(CategoryEnum.birthdayCalendar).copyWith(
          calendarEvents: CalendarModel(
            startDate: start,
            endDate: DateTime.utc(2026, 4, 30),
            dateEventMap: {
              start: [
                for (var i = 0; i < 3; i++)
                  DateEventModel(
                    time: const TimeOfDay(hour: 20, minute: 30),
                    description: 'Dinner at the restaurant by the sea $i',
                  ),
              ],
            },
          ),
        ),
      ),
    ),
    'surprise': (
      Routing.displayBirthdaySurprise,
      (
        category: _category(CategoryEnum.birthdaySuprise).copyWith(
          surpriseMap: {
            0: {'title': _longTitle},
            1: {'description': _longText},
            2: {'image': 'https://example.com/s.jpg'},
            3: {'description': _longText},
          },
        ),
      ),
    ),
    'wishes open': (
      Routing.displayWishesList,
      (
        category: _category(CategoryEnum.wishesList).copyWith(
          wishesList: WishesModel(contract: _longText, lock: false),
        ),
        onDone: (WishesModel wishesList) {},
      ),
    ),
    'wishes locked': (
      Routing.displayWishesList,
      (
        category: _category(CategoryEnum.wishesList).copyWith(
          wishesList: const WishesModel(
            lock: true,
            first: 'A trip to the north, thirty',
            second: 'Dinner at our place, thirty',
            third: 'A day at the spa together!',
          ),
        ),
        onDone: (WishesModel wishesList) {},
      ),
    ),
    'memory game': (
      Routing.displayMemoryGame,
      (
        category: _category(CategoryEnum.memoryGame).copyWith(
          memoryGame: MemoryGameModel(imagesUrls: _urls(6)),
        ),
        onDone: (int score) {},
      ),
    ),
    'memory game locked': (
      Routing.displayMemoryGame,
      (
        category: _category(CategoryEnum.memoryGame).copyWith(
          memoryGame: MemoryGameModel(
            imagesUrls: _urls(6),
            score: 6,
            lock: true,
          ),
        ),
        onDone: (int score) {},
      ),
    ),
    'empty calendar': (
      Routing.displayBirthdayCalendar,
      (category: _category(CategoryEnum.birthdayCalendar)),
    ),
  };
}

Future<void> _pumpPage(
  WidgetTester tester, {
  required AppLocale locale,
  required Size size,
  required String route,
  required Object extra,
}) async {
  LocaleSettings.setLocaleSync(locale);
  tester.view.physicalSize = size * 3;
  tester.view.devicePixelRatio = 3;
  addTearDown(tester.view.reset);

  final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (_, _) => const SizedBox()),
      GoRoute(path: Routing.home, builder: (_, _) => const Text('home')),
      ...categoryDisplayRoutes,
    ],
  );
  addTearDown(router.dispose);
  await tester.pumpWidget(
    MaterialApp.router(
      routerConfig: router,
      locale: locale.flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(
          context,
        ).copyWith(textScaler: const TextScaler.linear(1.6)),
        child: child!,
      ),
    ),
  );
  router.pushNamed(route, extra: extra);
  // Not pumpAndSettle: confetti loops forever on some pages.
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 400));
}

/// On short pages the display header scrolls away (NestedScrollView); the
/// body below it is only built once scrolled into view.
Future<void> _revealBody(WidgetTester tester) async {
  final nested = find.byType(NestedScrollView);
  if (nested.evaluate().isEmpty) return;
  await tester.drag(nested, const Offset(0, -1000));
  await tester.pump(const Duration(seconds: 1));
}

void main() {
  setUpAll(() async {
    await initializeDateFormatting();
    // Hebrew is a deferred library: load it once outside the fake-async test
    // zone, so tests can switch to it synchronously.
    await LocaleSettings.setLocale(AppLocale.he);
    await LocaleSettings.setLocale(AppLocale.en);
  });

  setUp(() {
    SessionService().reset();
    SessionService().partner = PersonaModel(
      name: 'Daniela',
      phoneNumber: '0500000000',
      password: '',
      role: RoleModel.owner,
      registerComplete: true,
    );
  });

  tearDownAll(() => LocaleSettings.setLocale(AppLocale.en));

  for (final locale in AppLocale.values) {
    for (final MapEntry(key: sizeName, value: size) in _sizes.entries) {
      for (final MapEntry(key: name, value: (route, extra))
          in _pages().entries) {
        testWidgets('$name fits (${locale.languageCode}, $sizeName, x1.6)', (
          tester,
        ) async {
          await _pumpPage(
            tester,
            locale: locale,
            size: size,
            route: route,
            extra: extra,
          );
          expect(tester.takeException(), isNull);
          // Let delayed work (memory game reveal) run, still without errors.
          await tester.pump(const Duration(seconds: 3));
          expect(tester.takeException(), isNull);
        });
      }

      testWidgets(
        'the full-size picture and contract dialogs fit '
        '(${locale.languageCode}, $sizeName, x1.6)',
        (tester) async {
          final (picturesRoute, picturesExtra) = _pages()['pictures']!;
          await _pumpPage(
            tester,
            locale: locale,
            size: size,
            route: picturesRoute,
            extra: picturesExtra,
          );
          await _revealBody(tester);
          await tester.tap(find.byType(CachedNetworkImage).hitTestable().first);
          await tester.pump();
          expect(find.byType(PageView), findsOneWidget);
          expect(tester.takeException(), isNull);

          final (wishesRoute, wishesExtra) = _pages()['wishes open']!;
          await _pumpPage(
            tester,
            locale: locale,
            size: size,
            route: wishesRoute,
            extra: wishesExtra,
          );
          final contract = find.text(
            t.please_read_contract(
              context: SessionService().gender,
              name: 'Daniela',
            ),
          );
          await tester.ensureVisible(contract);
          await tester.pump();
          await tester.tap(contract);
          await tester.pump();
          expect(
            find.textContaining('A long line', skipOffstage: false),
            findsOneWidget,
          );
          expect(tester.takeException(), isNull);
        },
      );

      testWidgets(
        'a selected calendar day with long events fits '
        '(${locale.languageCode}, $sizeName, x1.6)',
        (tester) async {
          final (route, extra) = _pages()['calendar']!;
          await _pumpPage(
            tester,
            locale: locale,
            size: size,
            route: route,
            extra: extra,
          );
          final day = find.text('1').first;
          await tester.ensureVisible(day);
          await tester.pump();
          await tester.tap(day);
          await tester.pump();
          expect(
            find.textContaining(
              'Dinner at the restaurant',
              skipOffstage: false,
            ),
            findsNWidgets(3),
          );
          expect(tester.takeException(), isNull);
        },
      );

      testWidgets(
        'a quiz question with image and long answers fits '
        '(${locale.languageCode}, $sizeName, x1.6)',
        (tester) async {
          await _pumpPage(
            tester,
            locale: locale,
            size: size,
            route: Routing.displayQuizGame,
            extra: (
              category: _category(
                CategoryEnum.quizGame,
              ).copyWith(quizGame: [_question(), _question(withImage: false)]),
              saveQuestion: (QuestionModel question, int index, int score) {},
            ),
          );
          final start = find.text(
            t.click_here_start(context: SessionService().gender),
          );
          await _revealBody(tester);
          await tester.tap(start);
          await tester.pump();
          expect(find.byType(QuizWidget), findsOneWidget);
          expect(tester.takeException(), isNull);

          // Below the fold on small screens: the question page scrolls.
          final answer1 = find.text('A long possible answer 1').first;
          await tester.ensureVisible(answer1);
          await tester.pump();
          await tester.tap(answer1);
          await tester.pump(const Duration(seconds: 1));
          await tester.pump(const Duration(milliseconds: 400));
          expect(tester.takeException(), isNull);
          // Below the fold on small screens: the question page scrolls.
          final answer0 = find.text('A long possible answer 0').last;
          await tester.ensureVisible(answer0);
          await tester.pump();
          await tester.tap(answer0);
          await tester.pump(const Duration(seconds: 1));
          await tester.pump(const Duration(milliseconds: 250));
          await tester.pump(const Duration(milliseconds: 400));
          expect(find.byType(DoneQuizScreen), findsOneWidget);
          expect(tester.takeException(), isNull);
        },
      );
    }
  }
}
