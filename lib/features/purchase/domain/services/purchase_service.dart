import 'dart:async';
import 'dart:developer';

import 'package:easy_birthday/features/purchase/data/models/purchase_outcome.dart';
import 'package:easy_birthday/features/purchase/data/models/store_purchase.dart';
import 'package:easy_birthday/features/purchase/domain/usecases/apply_purchased_plans_usecase.dart';
import 'package:easy_birthday/features/purchase/domain/usecases/complete_store_purchase_usecase.dart';
import 'package:easy_birthday/features/purchase/domain/usecases/recover_unconsumed_purchases_usecase.dart';
import 'package:easy_birthday/features/purchase/domain/usecases/save_pending_purchase_usecase.dart';
import 'package:easy_birthday/features/purchase/domain/usecases/watch_store_purchases_usecase.dart';

/// Handles store purchases for the whole app lifetime, so a paid plan is
/// written to the event even when the page that started the purchase is gone
/// or the store delivers it on a later launch.
///
/// A paid product is first saved on the device, then completed with the
/// store, then written to the event (now, or once the event exists).
/// Pages only start purchases and follow [outcomes].
///
/// On Google Play, purchases a previous run left unconsumed are recovered at
/// start (and after a failed purchase update) the same way.
class PurchaseService {
  final WatchStorePurchasesUseCase watchStorePurchasesUseCase;
  final CompleteStorePurchaseUseCase completeStorePurchaseUseCase;
  final SavePendingPurchaseUseCase savePendingPurchaseUseCase;
  final ApplyPurchasedPlansUseCase applyPurchasedPlansUseCase;
  final RecoverUnconsumedPurchasesUseCase recoverUnconsumedPurchasesUseCase;

  PurchaseService({
    required this.watchStorePurchasesUseCase,
    required this.completeStorePurchaseUseCase,
    required this.savePendingPurchaseUseCase,
    required this.applyPurchasedPlansUseCase,
    required this.recoverUnconsumedPurchasesUseCase,
  });

  final StreamController<PurchaseOutcome> _outcomes =
      StreamController<PurchaseOutcome>.broadcast();
  StreamSubscription<StorePurchase>? _subscription;

  /// Store updates are handled one at a time, in order. Writing to the event
  /// runs in its own queue: an offline Firestore write waits for the network,
  /// and must not hold back saving the next paid purchase on the device.
  Future<void> _storeQueue = Future.value();
  Future<void> _applyQueue = Future.value();
  bool _applyQueued = false;

  /// Saved purchases whose outcome the pages haven't been told yet.
  final Set<String> _unreported = {};

  Stream<PurchaseOutcome> get outcomes => _outcomes.stream;

  /// Starts listening to the store (once), recovers purchases left
  /// unconsumed and applies plans saved by a previous run.
  void start() {
    if (_subscription != null) return;
    try {
      _subscription = watchStorePurchasesUseCase().listen(
        (purchase) =>
            _storeQueue = _serial(_storeQueue, () => _handle(purchase)),
        onError: (Object e) => log('Purchase stream error: $e'),
      );
    } catch (e) {
      log('Store unavailable: $e');
    }
    _recoverUnconsumed();
    unawaited(applyPending());
  }

  /// Runs in the store queue, so it never overlaps handling a store update.
  void _recoverUnconsumed() => _storeQueue = _serial(_storeQueue, () async {
    final saved = await recoverUnconsumedPurchasesUseCase();
    if (saved.isEmpty) return;
    _unreported.addAll(saved);
    unawaited(applyPending());
  });

  /// Writes saved paid plans to the event if it exists by now. Cheap when
  /// nothing is pending; requests made while one is still waiting to run
  /// share it.
  Future<void> applyPending() {
    if (_applyQueued) return _applyQueue;
    _applyQueued = true;
    return _applyQueue = _serial(_applyQueue, () {
      _applyQueued = false;
      return _apply();
    });
  }

  static Future<void> _serial(
    Future<void> previous,
    Future<void> Function() task,
  ) => previous.then((_) => task()).catchError((Object e) {
    log('Purchase handling failed: $e');
  });

  Future<void> _handle(StorePurchase purchase) async {
    final productId = purchase.productId;
    switch (purchase.status) {
      case .pending:
        _emit(PurchasePending(productId));
      case .error:
        await _complete(purchase);
        _emit(PurchaseFailed(productId));
        // On Google Play a paid purchase whose consumption failed arrives as
        // an error; recover it now instead of on the next launch.
        if (planForProduct(productId) != null) _recoverUnconsumed();
      case .canceled:
        await _complete(purchase);
        _emit(PurchaseCanceled(productId));
      case .purchased || .restored:
        if (planForProduct(productId) == null) {
          log('Ignoring purchase of unknown product $productId');
          await _complete(purchase);
          return;
        }
        try {
          await savePendingPurchaseUseCase(productId);
        } catch (e) {
          // Not completed, so the store can deliver it again.
          log('Saving purchase $productId failed: $e');
          _emit(PurchaseFailed(productId));
          return;
        }
        _unreported.add(productId);
        await _complete(purchase);
        unawaited(applyPending());
    }
  }

  Future<void> _apply() async {
    final waiting = {..._unreported};
    try {
      for (final purchase in await applyPurchasedPlansUseCase()) {
        _unreported.remove(purchase.productId);
        waiting.remove(purchase.productId);
        _emit(PurchaseApplied(purchase.productId, purchase.plan));
      }
    } catch (e) {
      // Still saved on the device; retried on the next attempt.
      log('Applying purchased plans failed: $e');
    }
    // No event (or no signed-in user) yet: it stays saved for later.
    for (final productId in waiting) {
      _unreported.remove(productId);
      _emit(PurchaseSavedForLater(productId));
    }
  }

  Future<void> _complete(StorePurchase purchase) async {
    if (!purchase.needsCompletion) return;
    // The store re-delivers uncompleted purchases on the next launch.
    try {
      await completeStorePurchaseUseCase(purchase);
    } catch (e) {
      log('completePurchase failed for ${purchase.productId}: $e');
    }
  }

  void _emit(PurchaseOutcome outcome) {
    if (!_outcomes.isClosed) _outcomes.add(outcome);
  }

  Future<void> dispose() async {
    await _subscription?.cancel();
    _subscription = null;
    await _outcomes.close();
  }
}
