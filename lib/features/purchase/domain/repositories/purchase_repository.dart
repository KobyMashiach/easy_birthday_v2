import 'package:easy_birthday/features/event/data/models/plan_model.dart';
import 'package:easy_birthday/features/purchase/data/models/pending_purchase.dart';
import 'package:easy_birthday/features/purchase/data/models/store_purchase.dart';

abstract class PurchaseRepository {
  /// Store purchase updates, one at a time.
  Stream<StorePurchase> watchStorePurchases();

  /// Starts buying [plan]. False when the store can't sell it now.
  Future<bool> buyPlan(PlanModel plan);

  Future<void> completePurchase(StorePurchase purchase);

  /// Google Play only (empty elsewhere): paid plan purchases the store still
  /// holds unconsumed.
  Future<List<StorePurchase>> unconsumedPurchases();

  /// Google Play only: lets the plan be bought again (and not refunded).
  Future<void> consumePurchase(StorePurchase purchase);

  /// Keeps a paid product on the device for the signed-in user.
  Future<void> savePendingPurchase(String productId);

  /// Like [savePendingPurchase], but only the first time this store purchase
  /// is seen. True when it was saved now.
  Future<bool> savePendingPurchaseOnce(StorePurchase purchase);

  /// The signed-in user's paid products not yet written to their event.
  Future<List<PendingPurchase>> pendingPurchases();

  Future<void> removePendingPurchase(PendingPurchase purchase);
}
