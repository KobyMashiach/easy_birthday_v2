import 'dart:io';

import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/utils/routing/routing.dart';
import 'package:easy_birthday/features/category_display/presentation/category_display_routes.dart';
import 'package:easy_birthday/features/category_display/presentation/widgets/coupons/coupon_ticket.dart';
import 'package:easy_birthday/features/category_display/presentation/widgets/stats/parent_stat_texts.dart';
import 'package:easy_birthday/features/event/data/models/category_enum.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/features/event/data/models/child_model.dart';
import 'package:easy_birthday/features/event/data/models/event_model.dart';
import 'package:easy_birthday/features/event/data/models/look_alike_model.dart';
import 'package:easy_birthday/features/event/data/models/milestone_model.dart';
import 'package:easy_birthday/features/event/data/models/parent_stat.dart';
import 'package:easy_birthday/features/event/data/models/plan_model.dart';
import 'package:easy_birthday/features/event/data/models/time_capsule_model.dart';
import 'package:easy_birthday/features/event/data/models/wishes_model.dart';
import 'package:easy_birthday/features/event/domain/usecases/add_category_files_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/add_category_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/delete_category_files_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/delete_category_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/delete_media_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/get_current_category_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/reorder_categories_usecase.dart';
import 'package:easy_birthday/features/event/data/repositories_impl/event_repository_impl.dart';
import 'package:easy_birthday/features/event/domain/usecases/replace_memory_game_images_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/update_category_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/update_children_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/upload_category_files_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/watch_event_usecase.dart';
import 'package:easy_birthday/features/category_editor/presentation/pages/add_quiz_game_page.dart';
import 'package:easy_birthday/features/event/data/models/option_model.dart';
import 'package:easy_birthday/features/event/data/models/question_model.dart';
import 'package:easy_birthday/features/event/domain/usecases/upload_media_usecase.dart';
import 'package:easy_birthday/features/home/presentation/bloc/home_bloc.dart';
import 'package:easy_birthday/features/home/presentation/bloc/whats_new_bloc.dart';
import 'package:easy_birthday/features/settings/domain/usecases/save_app_settings_usecase.dart';
import 'package:easy_birthday/features/home/presentation/utils/category_templates.dart';
import 'package:easy_birthday/core/widgets/spotlight/spotlight.dart';
import 'package:easy_birthday/features/category_editor/presentation/pages/add_baby_letter_page.dart';
import 'package:easy_birthday/features/category_editor/presentation/pages/add_look_alike_page.dart';
import 'package:easy_birthday/features/category_editor/presentation/pages/add_milestones_page.dart';
import 'package:easy_birthday/features/category_editor/presentation/pages/add_parent_stats_page.dart';
import 'package:easy_birthday/features/category_editor/presentation/pages/add_time_capsule_page.dart';
import 'package:easy_birthday/core/errors/app_exception.dart';
import 'package:easy_birthday/features/home/presentation/widgets/choose_category_dialog.dart';
import 'package:easy_birthday/features/home/presentation/widgets/owner_home_view.dart';
import 'package:easy_birthday/features/home/presentation/widgets/whats_new_card.dart';
import 'package:easy_birthday/features/settings/presentation/bloc/children_bloc.dart'
    show ChildrenBloc;
import 'package:easy_birthday/features/settings/presentation/pages/children_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_birthday/features/user/data/models/persona_model.dart';
import 'package:easy_birthday/features/user/data/models/role_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../helpers/fakes.dart';

final DateTime _now = DateTime.now();
DateTime _ago({int years = 0, int months = 0, int days = 0}) =>
    DateTime(_now.year - years, _now.month - months, _now.day - days);

final ChildModel _baby = ChildModel(
  id: 'baby',
  name: 'Noa',
  dateOfBirth: _ago(months: 7),
);
final ChildModel _kid = ChildModel(
  id: 'kid',
  name: 'Ido',
  gender: 'male',
  dateOfBirth: _ago(years: 5),
);
final ChildModel _teen = ChildModel(
  id: 'teen',
  name: 'Tom',
  gender: 'male',
  dateOfBirth: _ago(years: 13),
);

EventModel _event(
  List<ChildModel> children, [
  List<CategoryModel>? categories,
]) => EventModel(
  eventId: 'e1',
  users: const [],
  planSubscribe: getPlan(PlansEnum.free),
  children: children,
  categories: categories ?? const [],
);

CategoryModel _category(CategoryEnum type, {List<String>? childIds}) =>
    CategoryModel(
      categoryType: type,
      name: type.name,
      description: '',
      id: 'c-${type.name}',
      titleAppear: 'A very long category title for the partner',
      childIds: childIds ?? const ['baby', 'kid'],
    );

void main() {
  setUpAll(() async {
    await initializeDateFormatting();
    await LocaleSettings.setLocale(AppLocale.he);
    await LocaleSettings.setLocale(AppLocale.en);
  });
  tearDownAll(() => LocaleSettings.setLocale(AppLocale.en));

  setUp(() {
    SessionService().reset();
    SessionService().partner = PersonaModel(
      name: 'Daniela',
      phoneNumber: '0500000000',
      password: '',
      role: RoleModel.owner,
      registerComplete: true,
    );
    SessionService().user = PersonaModel(
      name: 'Koby',
      phoneNumber: '0500000001',
      password: '',
      role: RoleModel.partner,
      registerComplete: true,
    );
  });

  group('children', () {
    test('ages read naturally', () {
      final DateTime birth = DateTime(2025, 1, 10);
      expect(ageBetween(birth, DateTime(2025, 1, 11)), t.age_day_one);
      expect(ageBetween(birth, DateTime(2025, 3, 10)), t.age_month_two);
      expect(
        ageBetween(birth, DateTime(2026, 4, 10)),
        t.age_and(first: t.age_year_one, second: t.age_months(n: 3)),
      );
      expect(ageBetween(birth, DateTime(2024, 1, 1)), t.age_days(n: 0));
    });

    test('days alive count whole days and never go negative', () {
      final child = ChildModel(
        id: 'a',
        name: 'A',
        dateOfBirth: DateTime(2026, 1, 1),
      );
      expect(child.daysAlive(DateTime(2026, 1, 31, 23)), 30);
      expect(child.daysAlive(DateTime(2025, 12, 1)), 0);
    });

    test('names join with "and"', () {
      expect(joinNames([_baby]), 'Noa');
      expect(joinNames([_baby, _kid, _teen]), 'Noa, Ido and Tom');
      expect(joinNames(const []), '');
    });

    test('family categories unlock by age', () {
      expect(familyCategoriesList(const []), isEmpty);
      final List<CategoryEnum> forTeen = [
        for (final c in familyCategoriesList([_teen])) c.categoryType,
      ];
      expect(forTeen, [
        CategoryEnum.lookAlike,
        CategoryEnum.timeCapsule,
        CategoryEnum.parentCoupons,
      ]);
      expect(familyCategoriesList([_baby]), hasLength(6));
      expect(eligibleChildren(CategoryEnum.babyLetter, [_baby, _kid, _teen]), [
        _baby,
      ]);
      expect(eligibleChildren(CategoryEnum.milestones, [_baby, _kid, _teen]), [
        _baby,
        _kid,
      ]);
      expect(eligibleChildren(CategoryEnum.text, [_baby]), isEmpty);
      expect(isPerChildCategory(CategoryEnum.parentCoupons), isFalse);
      expect(isPerChildCategory(CategoryEnum.lookAlike), isTrue);
    });

    test("a category's children are the existing ones, oldest first", () {
      SessionService().event = _event([_baby, _kid]);
      expect(
        childrenOf(
          _category(CategoryEnum.milestones, childIds: ['baby', 'gone', 'kid']),
        ),
        [_kid, _baby],
      );
    });
  });

  group('stats', () {
    test('per-child daily values add up by each child\'s days', () {
      final DateTime at = DateTime(2026, 1, 11);
      final a = ChildModel(
        id: 'a',
        name: 'A',
        dateOfBirth: DateTime(2026, 1, 1),
      );
      final b = ChildModel(
        id: 'b',
        name: 'B',
        dateOfBirth: DateTime(2026, 1, 6),
      );
      expect(parentStatTotalFor(6, [a, b], at), 6 * 10 + 6 * 5);
    });

    test('zero hides a stat', () {
      expect(
        ParentStat.active({'diapers': 6, 'coffee': 0, 'kisses': 2}),
        [(ParentStat.diapers, 6.0), (ParentStat.kisses, 2.0)],
      );
    });
  });

  test('look-alike tally counts one child or all', () {
    final answers = {
      lookAlikeKey('a', LookAlikeFeature.eyes): LookAlikeModel.owner,
      lookAlikeKey('a', LookAlikeFeature.nose): LookAlikeModel.partner,
      lookAlikeKey('a', LookAlikeFeature.hair): LookAlikeModel.partner,
      lookAlikeKey('b', LookAlikeFeature.eyes): LookAlikeModel.owner,
    };
    expect(lookAlikeScore(answers, 'a'), (1, 2));
    expect(lookAlikeScore(answers, 'b'), (1, 0));
    expect(lookAlikeScore(answers), (2, 2));
  });

  test('older events without the new fields still parse', () {
    final json = _event(const []).toJson()..remove('children');
    expect(EventModel.fromJson(json).children, isEmpty);
    expect(
      WishesModel.fromJson(const {'lock': true, 'first': 'x'}).redeemed,
      isEmpty,
    );
  });

  group('home bloc', () {
    late FakeEventRepository repository;
    late HomeBloc bloc;

    setUp(() {
      repository = FakeEventRepository();
      bloc = HomeBloc(
        addCategoryUseCase: AddCategoryUseCase(repository),
        updateCategoryUseCase: UpdateCategoryUseCase(repository),
        deleteCategoryUseCase: DeleteCategoryUseCase(repository),
        getCurrentCategoryUseCase: GetCurrentCategoryUseCase(repository),
        watchEventUseCase: WatchEventUseCase(repository),
        addCategoryFilesUseCase: AddCategoryFilesUseCase(repository),
        deleteCategoryFilesUseCase: DeleteCategoryFilesUseCase(repository),
        replaceMemoryGameImagesUseCase: ReplaceMemoryGameImagesUseCase(
          repository,
        ),
        uploadCategoryFilesUseCase: UploadCategoryFilesUseCase(repository),
        deleteMediaUseCase: DeleteMediaUseCase(repository),
        reorderCategoriesUseCase: ReorderCategoriesUseCase(repository),
      );
    });
    tearDown(() => bloc.close());

    CategoryModel saved(CategoryEnum type) => SessionService().event!.categories
        .firstWhere((c) => c.categoryType == type);

    test('milestones upload new photos, keep saved ones, sort by date '
        'and delete dropped photos', () async {
      final old = MilestoneModel(
        title: 'old',
        date: DateTime(2026, 3, 1),
        imageUrl: 'https://cdn/old.jpg',
      );
      final category = _category(CategoryEnum.milestones).copyWith(
        milestones: [old],
      );
      SessionService().event = _event([_baby], [category]);
      await emittedStates(
        bloc,
        () => bloc.add(
          .saveMilestones(category, [
            (
              MilestoneModel(title: 'late', date: DateTime(2026, 5, 1)),
              File('/late.jpg'),
            ),
            (old.copyWith(imageUrl: null), null),
            (MilestoneModel(title: 'early', date: DateTime(2026, 1, 1)), null),
          ]),
        ),
      );
      final milestones = saved(CategoryEnum.milestones).milestones!;
      expect([for (final m in milestones) m.title], ['early', 'old', 'late']);
      expect(milestones.last.imageUrl, 'https://cdn/e1/c-milestones/late.jpg');
      expect(repository.log, contains('deleteMedia:https://cdn/old.jpg'));
    });

    test(
      'look-alike keeps unpicked photos and maps picked ones by child',
      () async {
        final category = _category(CategoryEnum.lookAlike).copyWith(
          lookAlike: const LookAlikeModel(
            ownerImageUrl: 'https://cdn/owner.jpg',
            childImageUrls: {'baby': 'https://cdn/baby-old.jpg'},
          ),
        );
        SessionService().event = _event([_baby, _kid], [category]);
        await emittedStates(
          bloc,
          () => bloc.add(
            .saveLookAlike(
              category,
              {
                lookAlikeKey('baby', LookAlikeFeature.eyes):
                    LookAlikeModel.owner,
              },
              childImages: {'kid': File('/kid.jpg'), 'baby': File('/baby.jpg')},
              partnerImage: File('/partner.jpg'),
            ),
          ),
        );
        final lookAlike = saved(CategoryEnum.lookAlike).lookAlike!;
        expect(lookAlike.ownerImageUrl, 'https://cdn/owner.jpg');
        expect(lookAlike.partnerImageUrl, endsWith('/partner.jpg'));
        expect(lookAlike.childImageUrls['kid'], endsWith('/kid.jpg'));
        expect(lookAlike.childImageUrls['baby'], endsWith('/baby.jpg'));
        expect(lookAlike.ownerAnswers, hasLength(1));
        expect(
          repository.log,
          contains('deleteMedia:https://cdn/baby-old.jpg'),
        );
      },
    );

    test(
      'the partner finishing look-alike locks it; the owner reopens it',
      () async {
        final category = _category(
          CategoryEnum.lookAlike,
        ).copyWith(lookAlike: const LookAlikeModel());
        SessionService().event = _event([_baby], [category]);
        final answers = {
          lookAlikeKey('baby', LookAlikeFeature.eyes): LookAlikeModel.partner,
        };
        await emittedStates(
          bloc,
          () => bloc.add(.saveLookAlikeAnswers(category, answers)),
        );
        expect(saved(CategoryEnum.lookAlike).lookAlike!.lock, isTrue);
        expect(
          saved(CategoryEnum.lookAlike).lookAlike!.partnerAnswers,
          answers,
        );
        await emittedStates(bloc, () => bloc.add(.resetLookAlike(category)));
        expect(saved(CategoryEnum.lookAlike).lookAlike!.lock, isFalse);
        expect(
          saved(CategoryEnum.lookAlike).lookAlike!.partnerAnswers,
          isEmpty,
        );
      },
    );

    test("the partner's capsule letter keeps the owner's", () async {
      final category = _category(CategoryEnum.timeCapsule);
      SessionService().event = _event([_baby], [category]);
      await emittedStates(
        bloc,
        () => bloc.add(.saveTimeCapsule(category, 'owner', DateTime(2030))),
      );
      await emittedStates(
        bloc,
        () => bloc.add(.saveTimeCapsuleLetter(category, 'partner')),
      );
      await emittedStates(
        bloc,
        () => bloc.add(.saveTimeCapsule(category, 'owner 2', DateTime(2031))),
      );
      final capsule = saved(CategoryEnum.timeCapsule).timeCapsule!;
      expect(capsule.ownerLetter, 'owner 2');
      expect(capsule.partnerLetter, 'partner');
      expect(capsule.openDate, DateTime(2031));
    });

    test(
      'coupons open in the wishes editor and a reset un-redeems them',
      () async {
        final category = _category(CategoryEnum.parentCoupons).copyWith(
          wishesList: const WishesModel(
            lock: true,
            first: 'a',
            redeemed: [0, 2],
          ),
        );
        SessionService().event = _event([_baby], [category]);
        final states = await emittedStates(
          bloc,
          () => bloc.add(.addOrEditCategory(category, edit: true)),
        );
        expect(states.whereType<NavigateToAddWishesList>(), hasLength(1));
        await emittedStates(bloc, () => bloc.add(.resetWishes(category)));
        expect(saved(CategoryEnum.parentCoupons).wishesList!.redeemed, isEmpty);
      },
    );
  });

  test('children bloc adds, edits and deletes on the event', () async {
    final repository = FakeEventRepository();
    SessionService().event = _event(const []);
    final bloc = ChildrenBloc(
      updateChildrenUseCase: UpdateChildrenUseCase(repository),
    );
    addTearDown(bloc.close);
    await emittedStates(bloc, () => bloc.add(.saveChild(_baby)));
    await emittedStates(bloc, () => bloc.add(.saveChild(_kid)));
    await emittedStates(
      bloc,
      () => bloc.add(.saveChild(_baby.copyWith(name: 'Noa Lee'))),
    );
    expect(
      [for (final c in SessionService().event!.children) c.name],
      [
        'Noa Lee',
        'Ido',
      ],
    );
    await emittedStates(bloc, () => bloc.add(.deleteChild(_kid)));
    expect(SessionService().event!.children, hasLength(1));
    expect(bloc.state.children, hasLength(1));
  });

  group('display pages', () {
    Map<String, (String, Object)> pages() {
      final family = [_baby, _kid];
      final coupons = WishesModel(
        lock: false,
        contract: 'A long contract line. ' * 10,
      );
      return {
        'coupons open': (
          Routing.displayParentCoupons,
          (
            category: _category(
              CategoryEnum.parentCoupons,
            ).copyWith(wishesList: coupons),
            onDone: (WishesModel wishes) {},
          ),
        ),
        'coupons printed': (
          Routing.displayParentCoupons,
          (
            category: _category(CategoryEnum.parentCoupons).copyWith(
              wishesList: coupons.copyWith(
                lock: true,
                first: 'A full night without getting up, for real',
                second: 'Date night',
                third: 'A long shower without anyone knocking on the door',
                redeemed: const [1],
              ),
            ),
            onDone: (WishesModel wishes) {},
          ),
        ),
        'baby letter': (
          Routing.displayBabyLetter,
          (
            category: _category(
              CategoryEnum.babyLetter,
            ).copyWith(text: 'Dear Dad, ' * 40),
          ),
        ),
        'capsule sealed': (
          Routing.displayTimeCapsule,
          (
            category: _category(CategoryEnum.timeCapsule).copyWith(
              timeCapsule: TimeCapsuleModel(
                openDate: _now.add(const Duration(days: 400)),
                ownerLetter: 'secret',
              ),
            ),
            onSaveLetter: (String letter) {},
          ),
        ),
        'capsule open': (
          Routing.displayTimeCapsule,
          (
            category: _category(CategoryEnum.timeCapsule).copyWith(
              timeCapsule: TimeCapsuleModel(
                openDate: _ago(days: 1),
                ownerLetter: 'Owner letter. ' * 20,
                partnerLetter: 'Partner letter. ' * 20,
              ),
            ),
            onSaveLetter: (String letter) {},
          ),
        ),
        'stats': (
          Routing.displayParentStats,
          (
            category: _category(
              CategoryEnum.parentStats,
            ).copyWith(parentStats: ParentStat.defaults),
          ),
        ),
        'milestones': (
          Routing.displayMilestones,
          (
            category: _category(CategoryEnum.milestones).copyWith(
              milestones: [
                for (var i = 0; i < 6; i++)
                  MilestoneModel(
                    title: 'A long milestone title number $i',
                    date: _ago(months: 6 - i),
                    childId: family[i % 2].id,
                    note: i.isEven ? 'A note about this moment. ' * 4 : null,
                    imageUrl: i == 2 ? 'https://example.com/m.jpg' : null,
                  ),
              ],
            ),
          ),
        ),
        'look-alike game': (
          Routing.displayLookAlike,
          (
            category: _category(CategoryEnum.lookAlike).copyWith(
              lookAlike: const LookAlikeModel(
                childImageUrls: {
                  'baby': 'https://example.com/b.jpg',
                  'kid': 'https://example.com/k.jpg',
                },
              ),
            ),
            onDone: (Map<String, String> answers) {},
          ),
        ),
        'look-alike results': (
          Routing.displayLookAlike,
          (
            category: _category(CategoryEnum.lookAlike).copyWith(
              lookAlike: LookAlikeModel(
                lock: true,
                childImageUrls: const {
                  'baby': 'https://example.com/b.jpg',
                  'kid': 'https://example.com/k.jpg',
                },
                partnerAnswers: {
                  for (final feature in LookAlikeFeature.values) ...{
                    lookAlikeKey('baby', feature): LookAlikeModel.owner,
                    lookAlikeKey('kid', feature): feature.index.isEven
                        ? LookAlikeModel.owner
                        : LookAlikeModel.partner,
                  },
                },
                ownerAnswers: {
                  lookAlikeKey('baby', LookAlikeFeature.eyes):
                      LookAlikeModel.owner,
                },
              ),
            ),
            onDone: (Map<String, String> answers) {},
          ),
        ),
        'empty stats (children removed)': (
          Routing.displayParentStats,
          (category: _category(CategoryEnum.parentStats, childIds: ['gone'])),
        ),
      };
    }

    Future<GoRouter> pumpPage(
      WidgetTester tester, {
      required AppLocale locale,
      required Size size,
      required String route,
      required Object extra,
    }) async {
      LocaleSettings.setLocaleSync(locale);
      SessionService().event = _event([_baby, _kid]);
      tester.view.physicalSize = size * 3;
      tester.view.devicePixelRatio = 3;
      addTearDown(tester.view.reset);
      final router = GoRouter(
        routes: [
          GoRoute(path: '/', builder: (_, _) => const SizedBox()),
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
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 400));
      return router;
    }

    for (final locale in AppLocale.values) {
      for (final size in const [Size(360, 640), Size(640, 360)]) {
        for (final MapEntry(key: name, value: (route, extra))
            in pages().entries) {
          testWidgets('$name renders (${locale.languageCode}, $size, x1.6)', (
            tester,
          ) async {
            await pumpPage(
              tester,
              locale: locale,
              size: size,
              route: route,
              extra: extra,
            );
            expect(tester.takeException(), isNull);
            await tester.pump(const Duration(seconds: 3));
            expect(tester.takeException(), isNull);
          });
        }
      }
    }

    testWidgets('the letter envelope opens onto the letter', (tester) async {
      final (route, extra) = pages()['baby letter']!;
      await pumpPage(
        tester,
        locale: AppLocale.he,
        size: const Size(360, 640),
        route: route,
        extra: extra,
      );
      // Anywhere on the page opens it.
      await tester.tapAt(const Offset(180, 400));
      // Start the opening, let it finish, then let the letter switch in.
      await tester.pump();
      await tester.pump(const Duration(seconds: 2));
      await tester.pump(const Duration(seconds: 1));
      expect(find.textContaining('Dear Dad'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('playing look-alike to the end saves the answers', (
      tester,
    ) async {
      Map<String, String>? saved;
      final (route, _) = pages()['look-alike game']!;
      final category = _category(CategoryEnum.lookAlike, childIds: ['baby'])
          .copyWith(
            lookAlike: const LookAlikeModel(
              childImageUrls: {'baby': 'https://example.com/b.jpg'},
            ),
          );
      await pumpPage(
        tester,
        locale: AppLocale.en,
        size: const Size(360, 800),
        route: route,
        extra: (
          category: category,
          onDone: (Map<String, String> answers) => saved = answers,
        ),
      );
      for (var i = 0; i < LookAlikeFeature.values.length; i++) {
        await tester.ensureVisible(find.text('Daniela').first);
        await tester.tap(find.text('Daniela').first);
        await tester.pump(const Duration(milliseconds: 600));
      }
      expect(saved, hasLength(LookAlikeFeature.values.length));
      expect(lookAlikeScore(saved!), (LookAlikeFeature.values.length, 0));
      expect(
        find.text(t.look_alike_winner_girl(name: 'Noa', parent: 'Daniela')),
        findsOneWidget,
      );
      expect(tester.takeException(), isNull);
    });
  });

  group('coupon ticket', () {
    Future<List<int>> pumpAndDrag(
      WidgetTester tester, {
      required TextDirection direction,
      required double dx,
    }) async {
      final List<int> redeemed = [];
      await tester.pumpWidget(
        MaterialApp(
          home: Directionality(
            textDirection: direction,
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(20),
                child: CouponTicket(
                  text: 'Sleep in',
                  number: 1,
                  redeemed: false,
                  onRedeem: () => redeemed.add(1),
                ),
              ),
            ),
          ),
        ),
      );
      await tester.drag(find.text(t.coupon_stub), Offset(dx, 0));
      // First frame starts the tear-off animation, the next one ends it.
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));
      return redeemed;
    }

    testWidgets('tears when the stub is dragged outwards (LTR)', (
      tester,
    ) async {
      expect(await pumpAndDrag(tester, direction: TextDirection.ltr, dx: 200), [
        1,
      ]);
    });

    testWidgets('tears outwards to the left in RTL', (tester) async {
      expect(
        await pumpAndDrag(tester, direction: TextDirection.rtl, dx: -200),
        [1],
      );
    });

    testWidgets('a short or inward drag springs back', (tester) async {
      expect(
        await pumpAndDrag(tester, direction: TextDirection.ltr, dx: 15),
        isEmpty,
      );
      expect(
        await pumpAndDrag(tester, direction: TextDirection.ltr, dx: -200),
        isEmpty,
      );
    });

    testWidgets('a redeemed ticket has no stub and is stamped', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CouponTicket(text: 'x', number: 2, redeemed: true),
          ),
        ),
      );
      await tester.pump(const Duration(seconds: 1));
      expect(find.text(t.coupon_stub), findsNothing);
      expect(find.textContaining(t.redeemed), findsOneWidget);
    });
  });

  group('owner screens', () {
    Future<void> pumpScreen(
      WidgetTester tester,
      Widget screen, {
      required AppLocale locale,
      Size size = const Size(360, 640),
    }) async {
      LocaleSettings.setLocaleSync(locale);
      tester.view.physicalSize = size * 3;
      tester.view.devicePixelRatio = 3;
      addTearDown(tester.view.reset);
      await tester.pumpWidget(
        RepositoryProvider<UpdateChildrenUseCase>.value(
          value: UpdateChildrenUseCase(FakeEventRepository()),
          child: MaterialApp(
            locale: locale.flutterLocale,
            supportedLocales: AppLocaleUtils.supportedLocales,
            localizationsDelegates: GlobalMaterialLocalizations.delegates,
            builder: (context, child) => MediaQuery(
              data: MediaQuery.of(
                context,
              ).copyWith(textScaler: const TextScaler.linear(1.6)),
              child: child!,
            ),
            home: screen,
          ),
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));
    }

    setUp(() {
      // The owner is signed in here.
      SessionService().user = SessionService().user.copyWith(
        role: RoleModel.owner,
      );
      SessionService().event = _event([_baby, _kid]);
    });

    void noop(CategoryModel category) {}

    Map<String, Widget> screens() => {
      'baby letter': AddBabyLetterScreen(
        category: _category(CategoryEnum.babyLetter),
        onChangeTitle: noop,
        onDone: (_, _) {},
      ),
      'time capsule': AddTimeCapsuleScreen(
        category: _category(CategoryEnum.timeCapsule).copyWith(
          timeCapsule: TimeCapsuleModel(
            openDate: DateTime(2040),
            ownerLetter: 'x',
            partnerLetter: 'y',
          ),
        ),
        onChangeTitle: noop,
        onDone: (_, _, _) {},
      ),
      'parent stats': AddParentStatsScreen(
        category: _category(CategoryEnum.parentStats),
        onChangeTitle: noop,
        onDone: (_, _) {},
      ),
      'milestones': AddMilestonesScreen(
        category: _category(CategoryEnum.milestones).copyWith(
          milestones: [
            MilestoneModel(
              title: 'A long milestone title here',
              date: _ago(months: 2),
              childId: 'kid',
            ),
          ],
        ),
        onChangeTitle: noop,
        onDone: (_, _) {},
      ),
      'look-alike': AddLookAlikeScreen(
        category: _category(
          CategoryEnum.lookAlike,
        ).copyWith(lookAlike: const LookAlikeModel(lock: true)),
        onChangeTitle: noop,
        onDone: (_, _, _, _, _) {},
        onReset: () {},
      ),
      'children': const ChildrenScreen(),
      'choose category': const Scaffold(
        body: ChooseCategoryDialog(onChooseCategory: _ignore),
      ),
    };

    for (final locale in AppLocale.values) {
      for (final MapEntry(key: name, value: screen) in screens().entries) {
        testWidgets('$name renders (${locale.languageCode}, x1.6)', (
          tester,
        ) async {
          await pumpScreen(tester, screen, locale: locale);
          expect(tester.takeException(), isNull);
        });
      }
    }

    testWidgets('the milestone sheet fits', (tester) async {
      await pumpScreen(tester, screens()['milestones']!, locale: AppLocale.he);
      await tester.dragUntilVisible(
        find.text(t.add_milestone),
        find.byType(ListView),
        const Offset(0, -200),
      );
      await tester.ensureVisible(find.text(t.add_milestone).first);
      await tester.pump();
      await tester.tap(find.text(t.add_milestone).first);
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));
      expect(
        find.textContaining(t.ms_first_smile, skipOffstage: false),
        findsWidgets,
      );
      expect(tester.takeException(), isNull);
    });

    testWidgets('choosing a family category suggests a title with the names', (
      tester,
    ) async {
      CategoryModel? chosen;
      await pumpScreen(
        tester,
        Scaffold(
          body: ChooseCategoryDialog(onChooseCategory: (c) => chosen = c),
        ),
        locale: AppLocale.en,
        size: const Size(400, 1000),
      );
      await tester.ensureVisible(find.text(t.milestones));
      await tester.pump();
      await tester.tap(find.text(t.milestones));
      await tester.pump();
      expect(
        find.text(t.milestones_title(name: 'Ido and Noa')),
        findsOneWidget,
      );
      // Unselect Noa: the title follows.
      await tester.ensureVisible(find.text('${_baby.emoji} Noa'));
      await tester.pump();
      await tester.tap(find.text('${_baby.emoji} Noa'));
      await tester.pump();
      expect(find.text(t.milestones_title(name: 'Ido')), findsOneWidget);
      await tester.ensureVisible(find.text(t.ok));
      await tester.pump();
      await tester.tap(find.text(t.ok));
      await tester.pump();
      expect(chosen?.childIds, ['kid']);
    });

    testWidgets('without children the dialog points to the settings', (
      tester,
    ) async {
      SessionService().event = _event(const []);
      await pumpScreen(
        tester,
        const Scaffold(body: ChooseCategoryDialog(onChooseCategory: _ignore)),
        locale: AppLocale.he,
      );
      expect(
        find.text(
          t.add_children_to_unlock(context: SessionService().gender),
          skipOffstage: false,
        ),
        findsOneWidget,
      );
      expect(find.text(t.milestones), findsNothing);
    });

    testWidgets('the what\'s new spotlight shows and pops its action', (
      tester,
    ) async {
      final GlobalKey target = GlobalKey();
      WhatsNewAction? action;
      await pumpScreen(
        tester,
        Scaffold(
          floatingActionButton: FloatingActionButton(
            key: target,
            onPressed: () {},
          ),
          body: Builder(
            builder: (context) => TextButton(
              onPressed: () async => action = await showSpotlight(
                context: context,
                target: target,
                builder: (_) => WhatsNewCard.owner(hasChildren: true),
              ),
              child: const Text('open'),
            ),
          ),
        ),
        locale: AppLocale.he,
      );
      await tester.tap(find.text('open'));
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));
      expect(tester.takeException(), isNull);
      final letsTry = find.text(t.lets_try(context: SessionService().gender));
      await tester.ensureVisible(letsTry);
      await tester.pump();
      await tester.tap(letsTry);
      await tester.pump(const Duration(seconds: 1));
      expect(action, WhatsNewAction.tryNow);
    });
  });

  group("what's new", () {
    late FakeSettingsRepository settings;
    late WhatsNewBloc bloc;

    setUp(() {
      settings = FakeSettingsRepository();
      bloc = WhatsNewBloc(
        saveAppSettingsUseCase: SaveAppSettingsUseCase(settings),
      );
      SessionService().appSettings = SessionService().appSettings.copyWith(
        whatsNewSeen: null,
      );
    });
    tearDown(() => bloc.close());

    Future<List<WhatsNewState>> run(WhatsNewEvent event) =>
        emittedStates(bloc, () => bloc.add(event));

    test('the owner gets it once, on the add button', () async {
      SessionService().user = SessionService().user.copyWith(
        role: RoleModel.owner,
      );
      SessionService().event = _event([_baby]);
      expect((await run(const .check())).single, isA<ShowOwner>());
      // Still open: a reload doesn't stack another one.
      expect(await run(const .check()), isEmpty);
      await run(const .seen());
      expect(SessionService().appSettings.whatsNewSeen, whatsNewVersion);
      expect(await run(const .check()), isEmpty);
    });

    test('the partner gets the intro, then the first family category made '
        'for them', () async {
      SessionService().event = _event([_baby]);
      final intro = (await run(const .check())).single as ShowPartner;
      expect(intro.category, isNull);
      await run(const .seen());
      expect(SessionService().appSettings.whatsNewSeen, whatsNewIntroVersion);
      expect(await run(const .check()), isEmpty);

      final letter = _category(CategoryEnum.babyLetter);
      SessionService().event = _event(
        [_baby],
        [_category(CategoryEnum.text), letter],
      );
      final spotlight = (await run(const .check())).single as ShowPartner;
      expect(spotlight.category, letter);
      await run(const .seen());
      expect(await run(const .check()), isEmpty);
    });
  });

  test('every category suggests a title', () {
    SessionService().partner = SessionService().partner!.copyWith(
      gender: 'female',
    );
    for (final type in CategoryEnum.values) {
      expect(
        suggestedCategoryTitle(type, [_baby]),
        isNotEmpty,
        reason: '$type',
      );
    }
    expect(
      suggestedCategoryTitle(CategoryEnum.birthdaySuprise, const []),
      t.title_surprise(name: 'Daniela'),
    );
  });

  group('category order', () {
    CategoryModel named(String id) =>
        _category(CategoryEnum.text).copyWith(id: id);

    test('ids set the order; unknown ids are skipped, unlisted ones last', () {
      final cats = [named('a'), named('b'), named('c'), named('d')];
      expect(
        [
          for (final c in orderCategories(cats, ['c', 'x', 'a'])) c.id,
        ],
        ['c', 'a', 'b', 'd'],
      );
    });

    HomeBloc homeBloc(FakeEventRepository repository) => HomeBloc(
      addCategoryUseCase: AddCategoryUseCase(repository),
      updateCategoryUseCase: UpdateCategoryUseCase(repository),
      deleteCategoryUseCase: DeleteCategoryUseCase(repository),
      getCurrentCategoryUseCase: GetCurrentCategoryUseCase(repository),
      watchEventUseCase: WatchEventUseCase(repository),
      addCategoryFilesUseCase: AddCategoryFilesUseCase(repository),
      deleteCategoryFilesUseCase: DeleteCategoryFilesUseCase(repository),
      replaceMemoryGameImagesUseCase: ReplaceMemoryGameImagesUseCase(
        repository,
      ),
      uploadCategoryFilesUseCase: UploadCategoryFilesUseCase(repository),
      deleteMediaUseCase: DeleteMediaUseCase(repository),
      reorderCategoriesUseCase: ReorderCategoriesUseCase(repository),
    );

    test('reordering shows at once, without the spinner', () async {
      final repository = FakeEventRepository();
      final bloc = homeBloc(repository);
      addTearDown(bloc.close);
      SessionService().event = _event(const [], [named('a'), named('b')]);
      final states = await emittedStates(
        bloc,
        () => bloc.add(const .reorderCategories(['b', 'a'])),
      );
      expect(states.whereType<Loading>(), isEmpty);
      expect(
        [for (final c in SessionService().event!.categories) c.id],
        [
          'b',
          'a',
        ],
      );
    });

    test('a failed reorder keeps the saved order and says so', () async {
      final repository = FakeEventRepository()
        ..updateError = const AppException(AppErrorType.unknown);
      final bloc = homeBloc(repository);
      addTearDown(bloc.close);
      SessionService().event = _event(const [], [named('a'), named('b')]);
      final states = await emittedStates(
        bloc,
        () => bloc.add(const .reorderCategories(['b', 'a'])),
      );
      expect(states.whereType<ErrorMessage>(), hasLength(1));
      expect(
        [for (final c in SessionService().event!.categories) c.id],
        [
          'a',
          'b',
        ],
      );
    });

    testWidgets('dragging a card by its handle reorders for the partner', (
      tester,
    ) async {
      LocaleSettings.setLocaleSync(AppLocale.en);
      SessionService().user = SessionService().user.copyWith(
        role: RoleModel.owner,
      );
      final repository = FakeEventRepository();
      final bloc = homeBloc(repository);
      addTearDown(bloc.close);
      SessionService().event = _event(const [], [
        named('a').copyWith(titleAppear: 'First'),
        named('b').copyWith(titleAppear: 'Second'),
        named('c').copyWith(titleAppear: 'Third'),
      ]);
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BlocProvider.value(
              value: bloc,
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) => OwnerHomeScreen(
                  categories: SessionService().event!.categories,
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pump(const Duration(seconds: 1));
      expect(
        find.text(
          t.drag_to_reorder(context: SessionService().gender, name: 'Daniela'),
        ),
        findsOneWidget,
      );
      final handle = find.byIcon(Icons.drag_indicator).first;
      final gesture = await tester.startGesture(tester.getCenter(handle));
      await tester.pump(const Duration(milliseconds: 100));
      await gesture.moveBy(const Offset(0, 300));
      await tester.pump(const Duration(milliseconds: 100));
      await gesture.up();
      await tester.pump(const Duration(seconds: 1));
      expect(repository.log, contains('reorder:b,c,a'));
      expect(tester.takeException(), isNull);
    });
  });

  group('quiz replay', () {
    final option = OptionModel(text: 'Yes', isCorrect: true);
    CategoryModel played() => _category(CategoryEnum.quizGame).copyWith(
      quizGameScore: 1,
      quizGame: [
        QuestionModel(
          text: 'Q1',
          options: [option],
          isLocked: true,
          selectedOption: option,
        ),
        QuestionModel(text: 'Q2', options: [option]),
      ],
    );

    test(
      'reopening clears the answers and the score, keeps the questions',
      () async {
        final repository = FakeEventRepository();
        final bloc = HomeBloc(
          addCategoryUseCase: AddCategoryUseCase(repository),
          updateCategoryUseCase: UpdateCategoryUseCase(repository),
          deleteCategoryUseCase: DeleteCategoryUseCase(repository),
          getCurrentCategoryUseCase: GetCurrentCategoryUseCase(repository),
          watchEventUseCase: WatchEventUseCase(repository),
          addCategoryFilesUseCase: AddCategoryFilesUseCase(repository),
          deleteCategoryFilesUseCase: DeleteCategoryFilesUseCase(repository),
          replaceMemoryGameImagesUseCase: ReplaceMemoryGameImagesUseCase(
            repository,
          ),
          uploadCategoryFilesUseCase: UploadCategoryFilesUseCase(repository),
          deleteMediaUseCase: DeleteMediaUseCase(repository),
          reorderCategoriesUseCase: ReorderCategoriesUseCase(repository),
        );
        addTearDown(bloc.close);
        SessionService().event = _event(const [], [played()]);
        await emittedStates(bloc, () => bloc.add(.resetQuiz(played())));
        final quiz = SessionService().event!.categories.single;
        expect(quiz.quizGameScore, 0);
        expect([for (final q in quiz.quizGame!) q.text], ['Q1', 'Q2']);
        expect(quiz.quizGame!.any((q) => q.isLocked), isFalse);
        expect(quiz.quizGame!.first.selectedOption, isNull);
      },
    );

    testWidgets('the editor offers it once the partner has answered', (
      tester,
    ) async {
      LocaleSettings.setLocaleSync(AppLocale.en);
      var reopened = 0;
      Future<void> pump(CategoryModel category) => tester.pumpWidget(
        RepositoryProvider<UploadMediaUseCase>.value(
          value: UploadMediaUseCase(FakeEventRepository()),
          child: MaterialApp.router(
            routerConfig: GoRouter(
              routes: [
                GoRoute(
                  path: '/',
                  builder: (_, _) => AddQuizGameScreen(
                    category: category,
                    onChangeTitle: (_) {},
                    onDone: (_, _) {},
                    openQuizAgain: () => reopened++,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
      await pump(
        played().copyWith(
          quizGame: [
            for (final q in played().quizGame!) q.copyWith(isLocked: false),
          ],
        ),
      );
      expect(find.text(t.open_new_quiz_game), findsNothing);

      await pump(played());
      final button = find.text(t.open_new_quiz_game);
      await tester.ensureVisible(button);
      await tester.pump();
      await tester.tap(button);
      await tester.pump();
      expect(reopened, 1);
    });
  });
}

void _ignore(CategoryModel category) {}
