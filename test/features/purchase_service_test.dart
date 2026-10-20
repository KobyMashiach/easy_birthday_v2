import 'dart:async';

import 'package:easy_birthday/core/errors/app_exception.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/features/event/data/models/event_model.dart';
import 'package:easy_birthday/features/event/data/models/plan_model.dart';
import 'package:easy_birthday/features/onboarding/presentation/bloc/choose_plan_bloc.dart';
import 'package:easy_birthday/features/purchase/data/datasources/pending_purchase_local_data_source.dart';
import 'package:easy_birthday/features/purchase/data/datasources/purchase_store_data_source.dart';
import 'package:easy_birthday/features/purchase/data/models/pending_purchase.dart';
import 'package:easy_birthday/features/purchase/data/models/purchase_outcome.dart';
import 'package:easy_birthday/features/purchase/data/models/store_purchase.dart';
import 'package:easy_birthday/features/purchase/data/repositories_impl/purchase_repository_impl.dart';
import 'package:easy_birthday/features/purchase/domain/services/purchase_service.dart';
import 'package:easy_birthday/features/purchase/domain/usecases/apply_purchased_plans_usecase.dart';
import 'package:easy_birthday/features/purchase/domain/usecases/buy_plan_usecase.dart';
import 'package:easy_birthday/features/purchase/domain/usecases/complete_store_purchase_usecase.dart';
import 'package:easy_birthday/features/purchase/domain/usecases/recover_unconsumed_purchases_usecase.dart';
import 'package:easy_birthday/features/purchase/domain/usecases/save_pending_purchase_usecase.dart';
import 'package:easy_birthday/features/purchase/domain/usecases/watch_purchase_outcomes_usecase.dart';
import 'package:easy_birthday/features/purchase/domain/usecases/watch_store_purchases_usecase.dart';
import 'package:easy_birthday/features/user/data/models/persona_model.dart';
import 'package:easy_birthday/features/user/data/models/role_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/fakes.dart';

const _owner = '+972500000001';

/// The store: the test pushes updates and sees what was bought / completed.
class FakePurchaseStore implements PurchaseStoreDataSource {
  final StreamController<List<StorePurchase>> updates =
      StreamController<List<StorePurchase>>.broadcast();
  final List<String> bought = [];
  final List<String> completed = [];
  bool available = true;

  /// Google Play's unconsumed purchases; consuming removes them.
  final List<StorePurchase> unconsumed = [];
  final List<String> consumed = [];
  bool consumeFails = false;

  void leaveUnconsumed(String productId, String purchaseId) => unconsumed.add(
    StorePurchase(
      productId: productId,
      status: .purchased,
      purchaseId: purchaseId,
    ),
  );

  void send(String productId, StorePurchaseStatus status) => updates.add([
    StorePurchase(
      productId: productId,
      status: status,
      needsCompletion: status != .pending,
    ),
  ]);

  @override
  Stream<List<StorePurchase>> get purchaseUpdates => updates.stream;

  @override
  Future<bool> buy(String productId) async {
    if (!available) return false;
    bought.add(productId);
    return true;
  }

  @override
  Future<void> complete(StorePurchase purchase) async =>
      completed.add(purchase.productId);

  @override
  Future<List<StorePurchase>> unconsumedPurchases() async => [...unconsumed];

  @override
  Future<void> consume(StorePurchase purchase) async {
    if (consumeFails) throw Exception('consume failed');
    unconsumed.removeWhere((p) => p.purchaseId == purchase.purchaseId);
    consumed.add(purchase.productId);
  }
}

/// The device storage; survives "restarts" (new services) within a test.
class FakePendingStorage implements PendingPurchaseLocalDataSource {
  final Map<int, String> saved = {};
  int _nextKey = 0;

  @override
  Future<List<PendingPurchase>> getAll() async => [
    for (final entry in saved.entries)
      PendingPurchase.decode(entry.key, entry.value),
  ];

  @override
  Future<void> add(PendingPurchase purchase) async =>
      saved[_nextKey++] = purchase.encode();

  @override
  Future<void> remove(PendingPurchase purchase) async =>
      saved.remove(purchase.key);

  final Set<String> savedIds = {};

  @override
  Future<bool> wasSaved(String purchaseId) async =>
      savedIds.contains(purchaseId);

  @override
  Future<void> markSaved(String purchaseId) async => savedIds.add(purchaseId);
}

/// An event write that waits (like Firestore offline) until [gate] opens.
class _SlowEventRepository extends FakeEventRepository {
  final Completer<void> gate = Completer<void>();

  @override
  Future<void> updatePlan(EventModel event, PlanModel plan) async {
    await gate.future;
    return super.updatePlan(event, plan);
  }
}

PersonaModel _user({String phone = _owner, String? eventId = 'e1'}) =>
    PersonaModel(
      name: 'owner',
      phoneNumber: phone,
      password: '',
      role: RoleModel.owner,
      registerComplete: true,
      eventId: eventId,
    );

EventModel _event() => EventModel(
  eventId: 'e1',
  users: const [_owner, '+972500000002'],
  planSubscribe: getPlan(PlansEnum.free),
);

void main() {
  late FakePurchaseStore store;
  late FakePendingStorage storage;
  late FakeEventRepository events;
  late PurchaseRepositoryImpl repository;
  late List<PurchaseService> services;
  late List<PurchaseOutcome> outcomes;

  PurchaseService startService() {
    final service = PurchaseService(
      watchStorePurchasesUseCase: WatchStorePurchasesUseCase(repository),
      completeStorePurchaseUseCase: CompleteStorePurchaseUseCase(repository),
      savePendingPurchaseUseCase: SavePendingPurchaseUseCase(repository),
      applyPurchasedPlansUseCase: ApplyPurchasedPlansUseCase(
        purchaseRepository: repository,
        eventRepository: events,
      ),
      recoverUnconsumedPurchasesUseCase: RecoverUnconsumedPurchasesUseCase(
        repository,
      ),
    );
    service.outcomes.listen(outcomes.add);
    services.add(service);
    return service..start();
  }

  setUp(() {
    SessionService()
      ..reset()
      ..user = _user();
    store = FakePurchaseStore();
    storage = FakePendingStorage();
    events = FakeEventRepository()..events['e1'] = _event();
    repository = PurchaseRepositoryImpl(
      storeDataSource: store,
      localDataSource: storage,
    );
    services = [];
    outcomes = [];
  });
  tearDown(() async {
    for (final service in services) {
      await service.dispose();
    }
    await store.updates.close();
  });

  group('PurchaseService', () {
    test('a purchase is completed and its plan written to the event', () async {
      startService();
      store.send('platinum_plan', .purchased);
      await pumpEventQueue();

      expect(store.completed, ['platinum_plan']);
      expect(events.updatedEvents.single.planSubscribe.isPlatinum, isTrue);
      expect(SessionService().event?.planSubscribe.isPlatinum, isTrue);
      expect(
        outcomes.single,
        isA<PurchaseApplied>().having((o) => o.plan.isPlatinum, 'plan', true),
      );
      expect(storage.saved, isEmpty);
    });

    test('restored purchases are applied too', () async {
      startService();
      store.send('standard_plan', .restored);
      await pumpEventQueue();
      expect(events.updatedEvents.single.planSubscribe.isStandard, isTrue);
    });

    test('without an event yet the plan waits, then is applied once the '
        'event exists', () async {
      SessionService().user = _user(eventId: null);
      final service = startService();
      store.send('standard_plan', .purchased);
      await pumpEventQueue();

      expect(store.completed, ['standard_plan']);
      expect(events.updatedEvents, isEmpty);
      expect(outcomes.single, isA<PurchaseSavedForLater>());
      expect(storage.saved, hasLength(1));

      // The partner step links the event; the next navigation retries.
      SessionService().user = _user();
      await service.applyPending();
      await pumpEventQueue();

      expect(events.updatedEvents.single.planSubscribe.isStandard, isTrue);
      expect(outcomes.last, isA<PurchaseApplied>());
      expect(storage.saved, isEmpty);
    });

    test('a failed event write keeps the plan and a retry writes it', () async {
      events.updateError = const AppException(AppErrorType.networkError);
      final service = startService();
      store.send('platinum_plan', .purchased);
      await pumpEventQueue();

      expect(store.completed, ['platinum_plan']);
      expect(outcomes.single, isA<PurchaseSavedForLater>());
      expect(storage.saved, hasLength(1));

      events.updateError = null;
      await service.applyPending();
      expect(events.updatedEvents.single.planSubscribe.isPlatinum, isTrue);
      expect(storage.saved, isEmpty);
    });

    test(
      'a waiting event write never holds back saving the next purchase',
      () async {
        final slow = _SlowEventRepository()..events['e1'] = _event();
        events = slow;
        final service = startService();
        store.send('standard_plan', .purchased);
        await pumpEventQueue();
        store.send('platinum_plan', .purchased);
        await pumpEventQueue();
        // Both are on the device and completed while the first write waits.
        expect(storage.saved, hasLength(2));
        expect(store.completed, ['standard_plan', 'platinum_plan']);
        // Many retries while waiting share one queued run.
        for (var i = 0; i < 5; i++) {
          unawaited(service.applyPending());
        }

        slow.gate.complete();
        await pumpEventQueue();
        expect(storage.saved, isEmpty);
        expect(slow.updatedEvents.last.planSubscribe.isPlatinum, isTrue);
        expect(slow.updatedEvents.length, lessThanOrEqualTo(2));
        expect(outcomes.whereType<PurchaseApplied>().map((o) => o.productId), {
          'standard_plan',
          'platinum_plan',
        });
        expect(outcomes.whereType<PurchaseSavedForLater>(), isEmpty);
      },
    );

    test('a saved purchase survives an app restart', () async {
      events.updateError = const AppException(AppErrorType.networkError);
      final firstRun = startService();
      store.send('platinum_plan', .purchased);
      await pumpEventQueue();
      await firstRun.dispose();

      events.updateError = null;
      startService();
      await pumpEventQueue();
      expect(events.updatedEvents.single.planSubscribe.isPlatinum, isTrue);
      expect(storage.saved, isEmpty);
    });

    test('a purchase delivered before sign-in goes to the next user; another '
        "user's purchase is never applied", () async {
      SessionService().user = SessionService.emptyUser;
      final service = startService();
      store.send('standard_plan', .purchased);
      await pumpEventQueue();
      await storage.add(
        const PendingPurchase(
          productId: 'platinum_plan',
          ownerPhone: '+19999999',
        ),
      );
      expect(events.updatedEvents, isEmpty);

      SessionService().user = _user();
      await service.applyPending();
      expect(events.updatedEvents.single.planSubscribe.isStandard, isTrue);
      // The other user's purchase stays for them.
      expect(storage.saved, hasLength(1));
    });

    test('pending: reported, not completed, nothing written', () async {
      startService();
      store.send('platinum_plan', .pending);
      await pumpEventQueue();
      expect(outcomes.single, isA<PurchasePending>());
      expect(store.completed, isEmpty);
      expect(events.updatedEvents, isEmpty);
    });

    test(
      'error and canceled are completed and reported, nothing written',
      () async {
        startService();
        store
          ..send('platinum_plan', .error)
          ..send('standard_plan', .canceled);
        await pumpEventQueue();
        expect(outcomes.map((o) => o.runtimeType), [
          PurchaseFailed,
          PurchaseCanceled,
        ]);
        expect(store.completed, ['platinum_plan', 'standard_plan']);
        expect(events.updatedEvents, isEmpty);
      },
    );

    test('Google Play: an unconsumed purchase left by a crash is applied, '
        'then consumed, and never applied again', () async {
      store.leaveUnconsumed('platinum_plan', 'GPA.1');
      final firstRun = startService();
      await pumpEventQueue();

      expect(store.consumed, ['platinum_plan']);
      expect(store.unconsumed, isEmpty);
      expect(events.updatedEvents.single.planSubscribe.isPlatinum, isTrue);
      expect(outcomes.single, isA<PurchaseApplied>());
      expect(storage.saved, isEmpty);

      // Next launch: nothing left to recover.
      await firstRun.dispose();
      startService();
      await pumpEventQueue();
      expect(events.updatedEvents, hasLength(1));
    });

    test('Google Play: a purchase that could not be consumed is applied once '
        'and only consumed on later launches', () async {
      store
        ..leaveUnconsumed('standard_plan', 'GPA.2')
        ..consumeFails = true;
      final firstRun = startService();
      await pumpEventQueue();
      expect(events.updatedEvents.single.planSubscribe.isStandard, isTrue);
      expect(store.unconsumed, hasLength(1));

      await firstRun.dispose();
      store.consumeFails = false;
      startService();
      await pumpEventQueue();
      expect(store.consumed, ['standard_plan']);
      expect(events.updatedEvents, hasLength(1));
      expect(storage.saved, isEmpty);
    });

    test('Google Play: an unconsumed purchase recovered before sign-in waits '
        'for the user', () async {
      SessionService().user = _user(eventId: null);
      store.leaveUnconsumed('platinum_plan', 'GPA.3');
      final service = startService();
      await pumpEventQueue();
      expect(store.consumed, ['platinum_plan']);
      expect(outcomes.single, isA<PurchaseSavedForLater>());
      expect(storage.saved, hasLength(1));

      SessionService().user = _user();
      await service.applyPending();
      expect(events.updatedEvents.single.planSubscribe.isPlatinum, isTrue);
    });

    test('Google Play: a failed purchase update recovers the paid purchase '
        'right away', () async {
      startService();
      await pumpEventQueue();
      // Consuming failed inside the store plugin: reported as an error.
      store.leaveUnconsumed('standard_plan', 'GPA.4');
      store.send('standard_plan', .error);
      await pumpEventQueue();
      expect(outcomes.first, isA<PurchaseFailed>());
      expect(outcomes.last, isA<PurchaseApplied>());
      expect(events.updatedEvents.single.planSubscribe.isStandard, isTrue);
      expect(store.consumed, ['standard_plan']);
    });

    test('an unknown product is completed and ignored', () async {
      startService();
      store.send('mystery_plan', .purchased);
      await pumpEventQueue();
      expect(store.completed, ['mystery_plan']);
      expect(storage.saved, isEmpty);
      expect(events.updatedEvents, isEmpty);
    });
  });

  group('ChoosePlanBloc', () {
    late PurchaseService service;
    late ChoosePlanBloc bloc;

    setUp(() {
      service = startService();
      bloc = ChoosePlanBloc(
        buyPlanUseCase: BuyPlanUseCase(repository),
        watchPurchaseOutcomesUseCase: WatchPurchaseOutcomesUseCase(service),
      );
    });
    tearDown(() => bloc.close());

    test('shows the event plan, else the fallback', () async {
      var states = await emittedStates(
        bloc,
        () => bloc.add(.init(getPlan(PlansEnum.standard))),
      );
      expect(states.single.currentPlan.isStandard, isTrue);

      SessionService().event = _event().copyWith(
        planSubscribe: getPlan(PlansEnum.platinum),
      );
      states = await emittedStates(
        bloc,
        () => bloc.add(.init(getPlan(PlansEnum.free))),
      );
      expect(states.single.currentPlan.isPlatinum, isTrue);
    });

    test(
      'buy opens the store; the confirmed purchase updates the page',
      () async {
        await emittedStates(
          bloc,
          () => bloc.add(.init(getPlan(PlansEnum.free))),
        );
        await emittedStates(
          bloc,
          () => bloc.add(.buy(getPlan(PlansEnum.platinum))),
        );
        expect(store.bought, ['platinum_plan']);

        final states = await emittedStates(
          bloc,
          () => store.send('platinum_plan', .purchased),
        );
        expect(
          states.single,
          isA<PlanPurchased>()
              .having((s) => s.productId, 'productId', 'platinum_plan')
              .having((s) => s.currentPlan.isPlatinum, 'plan', true),
        );
      },
    );

    test('store unavailable / failed purchase show an error', () async {
      await emittedStates(bloc, () => bloc.add(.init(getPlan(PlansEnum.free))));
      store.available = false;
      var states = await emittedStates(
        bloc,
        () => bloc.add(.buy(getPlan(PlansEnum.standard))),
      );
      expect(states.single, isA<ErrorMessage>());

      states = await emittedStates(
        bloc,
        () => store.send('standard_plan', .error),
      );
      expect(states.single, isA<ErrorMessage>());
    });

    test(
      'leaving the page before the store confirms still writes the plan',
      () async {
        await emittedStates(
          bloc,
          () => bloc.add(.init(getPlan(PlansEnum.free))),
        );
        await emittedStates(
          bloc,
          () => bloc.add(.buy(getPlan(PlansEnum.standard))),
        );
        await bloc.close();

        store.send('standard_plan', .purchased);
        await pumpEventQueue();
        expect(events.updatedEvents.single.planSubscribe.isStandard, isTrue);
      },
    );
  });
}
