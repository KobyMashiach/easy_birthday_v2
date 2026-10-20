import 'package:easy_birthday/core/di/app_dependencies.dart';
import 'package:easy_birthday/features/purchase/domain/services/purchase_service.dart';
import 'package:easy_birthday/features/purchase/domain/usecases/apply_purchased_plans_usecase.dart';
import 'package:easy_birthday/features/purchase/domain/usecases/complete_store_purchase_usecase.dart';
import 'package:easy_birthday/features/purchase/domain/usecases/recover_unconsumed_purchases_usecase.dart';
import 'package:easy_birthday/features/purchase/domain/usecases/save_pending_purchase_usecase.dart';
import 'package:easy_birthday/features/purchase/domain/usecases/watch_store_purchases_usecase.dart';
import 'package:watch_connectivity/watch_connectivity.dart';

/// Long-lived services that outlive the widget tree.
class Injector {
  static final Injector _instance = Injector._internal();
  factory Injector() => _instance;
  Injector._internal();

  bool _initialized = false;

  /// Created on first use (only the Wear OS flows need it).
  late final WatchConnectivity watchConnectivity = WatchConnectivity();
  late final PurchaseService purchaseService;

  Future<void> init(AppDependencies deps) async {
    if (_initialized) return;
    _initialized = true;
    final purchases = deps.purchaseRepository;
    // Listens from app start, so purchases the store delivers late (or on a
    // later launch) are never lost.
    purchaseService = PurchaseService(
      watchStorePurchasesUseCase: WatchStorePurchasesUseCase(purchases),
      completeStorePurchaseUseCase: CompleteStorePurchaseUseCase(purchases),
      savePendingPurchaseUseCase: SavePendingPurchaseUseCase(purchases),
      applyPurchasedPlansUseCase: ApplyPurchasedPlansUseCase(
        purchaseRepository: purchases,
        eventRepository: deps.eventRepository,
      ),
      recoverUnconsumedPurchasesUseCase: RecoverUnconsumedPurchasesUseCase(
        purchases,
      ),
    )..start();
  }
}
