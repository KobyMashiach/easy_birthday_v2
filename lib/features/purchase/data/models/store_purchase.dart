/// Where a store purchase stands, as the store reports it.
enum StorePurchaseStatus { pending, purchased, restored, error, canceled }

/// One purchase update from the app store.
class StorePurchase {
  final String productId;
  final StorePurchaseStatus status;

  /// The store's id of this purchase (Google Play order id / App Store
  /// transaction id), when it has one.
  final String? purchaseId;

  /// The store waits for the app to confirm it has delivered the purchase.
  final bool needsCompletion;

  /// The store's own purchase object, needed to complete it.
  final Object? storeHandle;

  const StorePurchase({
    required this.productId,
    required this.status,
    this.purchaseId,
    this.needsCompletion = false,
    this.storeHandle,
  });
}
