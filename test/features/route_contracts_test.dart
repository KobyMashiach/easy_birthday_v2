import 'dart:io';

import 'package:easy_birthday/core/utils/routing/routing.dart';
import 'package:easy_birthday/features/auth/presentation/auth_routes.dart';
import 'package:easy_birthday/features/category_display/presentation/category_display_routes.dart';
import 'package:easy_birthday/features/category_editor/presentation/category_editor_routes.dart';
import 'package:easy_birthday/features/event/data/models/calendar_model.dart';
import 'package:easy_birthday/features/event/data/models/category_enum.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/features/event/data/models/plan_model.dart';
import 'package:easy_birthday/features/event/data/models/question_model.dart';
import 'package:easy_birthday/features/event/data/models/wishes_model.dart';
import 'package:easy_birthday/features/home/presentation/home_routes.dart';
import 'package:easy_birthday/features/onboarding/presentation/onboarding_routes.dart';
import 'package:easy_birthday/features/settings/presentation/settings_routes.dart';
import 'package:easy_birthday/features/splash/presentation/splash_routes.dart';
import 'package:easy_birthday/features/wear_os/presentation/wear_os_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

/// Every route of the app, with each builder replaced by one that runs the
/// real builder (so its `state.extra as <Record>` cast runs) but shows only
/// the page's type instead of building the page (no blocs/use cases needed).
List<RouteBase> _castOnly(List<RouteBase> routes) => [
  for (final route in routes)
    if (route is GoRoute)
      GoRoute(
        path: route.path,
        name: route.name,
        builder: (context, state) {
          final Widget page = switch (route.builder?.call(context, state) ??
              route.pageBuilder!(context, state)) {
            final Widget widget => widget,
            CustomTransitionPage(:final child) => child,
            CupertinoPage(:final child) => child,
            MaterialPage(:final child) => child,
            final other => throw StateError('Unexpected page $other'),
          };
          return Text('page:${page.runtimeType}');
        },
        routes: _castOnly(route.routes),
      )
    else
      route,
];

final List<RouteBase> _allRoutes = [
  GoRoute(path: '/', builder: (_, _) => const Text('root')),
  ...splashRoutes,
  ...authRoutes,
  ...onboardingRoutes,
  ...homeRoutes,
  ...categoryEditorRoutes,
  ...categoryDisplayRoutes,
  ...settingsRoutes,
  ...wearOsRoutes,
];

Future<void> _expectPage(
  WidgetTester tester,
  String route,
  Object? extra,
  String pageType, {
  Map<String, String> queryParameters = const {},
}) async {
  final router = GoRouter(routes: _castOnly(_allRoutes));
  addTearDown(router.dispose);
  await tester.pumpWidget(MaterialApp.router(routerConfig: router));
  router.pushNamed(route, extra: extra, queryParameters: queryParameters);
  await tester.pumpAndSettle();
  expect(tester.takeException(), isNull, reason: route);
  expect(find.text('page:$pageType'), findsOneWidget, reason: route);
}

const CategoryModel _category = CategoryModel(
  categoryType: CategoryEnum.text,
  name: 'text',
  description: '',
);

void main() {
  // The records below are written the way the callers write them (same
  // field names and parameter types); a mismatch makes the route's cast throw.
  void changeTitle(CategoryModel category) {}

  group('auth', () {
    testWidgets('login without extra (normal login)', (tester) async {
      await _expectPage(tester, Routing.login, null, 'LoginScreen');
    });
    testWidgets('login from the watch (main.dart)', (tester) async {
      void reply(bool loginSuccess, bool isOwner) {}
      await _expectPage(tester, Routing.login, (
        loginWithWatch: reply,
      ), 'LoginScreen');
    });
    testWidgets('otpVerification (login/register/change password)', (
      tester,
    ) async {
      await _expectPage(tester, Routing.otpVerification, (
        onVerification: (String otpCode) {},
        onTapSendAgain: () {},
        verificationId: 'id',
      ), 'OtpPhoneVerificationScreen');
    });
  });

  group('onboarding / settings', () {
    testWidgets('chooseAppColor', (tester) async {
      await _expectPage(tester, Routing.chooseAppColor, (
        onContinue: (Color? color) {},
      ), 'ChooseAppColorScreen');
    });
    testWidgets('choosePlan', (tester) async {
      await _expectPage(tester, Routing.choosePlan, (
        currentPlan: PlanModel(title: 'Free', price: 0),
        onPlanPurchase: (String? planTitle) {},
        onContinue: () {},
      ), 'ChoosePlanScreen');
    });
    testWidgets('buildApp from onboarding (non-null description)', (
      tester,
    ) async {
      await _expectPage(tester, Routing.buildApp, (
        loadingTime: 10,
        description: 'more',
      ), 'BuildAppPage');
    });
    testWidgets('buildApp from settings (nullable description, next)', (
      tester,
    ) async {
      const String? description = null;
      await _expectPage(
        tester,
        Routing.buildApp,
        (loadingTime: 3, description: description),
        'BuildAppPage',
        queryParameters: {'next': Routing.settings},
      );
    });
    testWidgets('settings children', (tester) async {
      await _expectPage(tester, Routing.changeLanguage, (
        onLanguageChange: (String languageCode) {},
      ), 'ChangeLanguageScreen');
      await _expectPage(tester, Routing.changePassword, (
        onPasswordChange: (String password) {},
      ), 'ChangePasswordScreen');
      await _expectPage(tester, Routing.genderChange, (
        changeGenderFunction: ((String owner, String partner) genders) {},
      ), 'GenderChangeScreen');
    });
  });

  group('category_editor (home callers)', () {
    testWidgets('addText + generateGreeting', (tester) async {
      await _expectPage(tester, Routing.addText, (
        category: _category,
        onChangeTitle: changeTitle,
        onDone: (CategoryModel category, String text) {},
      ), 'AddTextScreen');
      await _expectPage(tester, Routing.generateGreeting, (
        generateGreeting: (String? generateText) {},
      ), 'GenerateGreeting');
    });
    testWidgets('addPicturesVideos', (tester) async {
      await _expectPage(tester, Routing.addPicturesVideos, (
        category: _category,
        onChangeTitle: (CategoryModel category) {},
        isImagesPicker: true,
        onAddFiles: (CategoryModel category, List<File> files) {},
        onDeleteFiles: (CategoryModel category, List<int> indexes) {},
      ), 'AddPicturesVideosScreen');
    });
    testWidgets('quiz editor routes', (tester) async {
      await _expectPage(tester, Routing.addQuizGame, (
        category: _category,
        onChangeTitle: changeTitle,
        onDone: (List<QuestionModel> questions, bool lock) {},
      ), 'AddQuizGameScreen');
      await _expectPage(tester, Routing.addQuestion, (
        category: _category,
        onDone: (QuestionModel question, File? image) {},
      ), 'AddQuestionScreen');
      await _expectPage(tester, Routing.removeQuestions, (
        questionsList: <QuestionModel>[],
        onDone: (List<int> indexes) {},
      ), 'RemoveQuestionScreen');
    });
    testWidgets('calendar / surprise / wishes / memory editors', (
      tester,
    ) async {
      await _expectPage(tester, Routing.addBirthdayCalendar, (
        category: _category,
        onChangeTitle: changeTitle,
        onDone: (CategoryModel category, CalendarModel calendar) {},
      ), 'AddBirthdayCalendarScreen');
      await _expectPage(tester, Routing.addBirthdaySurprise, (
        category: _category,
        onChangeTitle: changeTitle,
        onDone: (CategoryModel category, List<Widget> widgets) {},
      ), 'AddBirthdaySurpriseScreen');
      await _expectPage(tester, Routing.addWishesList, (
        category: _category,
        onChangeTitle: changeTitle,
        onDone: (CategoryModel category, String text, bool edit) {},
        deleteWishes: () {},
      ), 'AddWishesListScreen');
      await _expectPage(tester, Routing.addMemoryGame, (
        category: _category,
        onChangeTitle: changeTitle,
        onDone:
            (
              CategoryModel category,
              List<String> keptUrls,
              List<File> newFiles,
            ) {},
        openMemoryAgain: () {},
      ), 'AddImagesMemoryGame');
    });
  });

  group('category_display (partner home callers)', () {
    testWidgets('all display routes', (tester) async {
      await _expectPage(tester, Routing.displayText, (
        category: _category,
      ), 'DisplayTextScreen');
      await _expectPage(tester, Routing.displayPicturesVideos, (
        category: _category,
        isImages: false,
      ), 'DisplayPicturesVideosScreen');
      await _expectPage(tester, Routing.displayQuizGame, (
        category: _category,
        saveQuestion: (QuestionModel question, int index, int score) {},
      ), 'DisplayQuizGame');
      await _expectPage(tester, Routing.doneQuiz, (
        score: 1,
        numOfQuestions: 2,
      ), 'DoneQuizScreen');
      await _expectPage(tester, Routing.displayBirthdayCalendar, (
        category: _category,
      ), 'DisplayBirthdayCalendar');
      await _expectPage(tester, Routing.displayBirthdaySurprise, (
        category: _category,
      ), 'DisplayBirthdaySurprise');
      await _expectPage(tester, Routing.displayWishesList, (
        category: _category,
        onDone: (WishesModel wishesList) {},
      ), 'DisplayWishesList');
      await _expectPage(tester, Routing.displayMemoryGame, (
        category: _category,
        onDone: (int score) {},
      ), 'DisplayMemoryGame');
    });
  });

  group('wear_os', () {
    testWidgets('wearOsCategories', (tester) async {
      await _expectPage(tester, Routing.wearOsCategories, (
        eventId: 'event',
      ), 'WearOsCategories');
    });
  });

  testWidgets('a wrong extra shape is caught (sanity check)', (tester) async {
    final router = GoRouter(routes: _castOnly(_allRoutes));
    addTearDown(router.dispose);
    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    router.pushNamed(Routing.wearOsCategories, extra: (id: 'event'));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isA<TypeError>());
  });
}
