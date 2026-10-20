import 'dart:developer';
import 'dart:io';

import 'package:easy_birthday/features/purchase/data/models/store_purchase.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/billing_client_wrappers.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';

abstract class PurchaseStoreDataSource {
  /// Every purchase update the store sends, for the app's whole lifetime
  /// (including purchases left unfinished by a previous run).
  Stream<List<StorePurchase>> get purchaseUpdates;

  /// Opens the store's payment sheet. False when the product can't be bought
  /// now (store unavailable, product not configured, offline...).
  Future<bool> buy(String productId);

  /// Tells the store the purchase was delivered.
  Future<void> complete(StorePurchase purchase);

  /// Google Play only (empty elsewhere): paid purchases of our products the
  /// store still holds unconsumed, e.g. the app was killed before handling
  /// them or consuming them failed. Play never sends these again on its own.
  Future<List<StorePurchase>> unconsumedPurchases();

  /// Google Play only: consumes [purchase] so the plan can be bought again
  /// and is not refunded. Throws when the store refuses.
  Future<void> consume(StorePurchase purchase);
}

class PurchaseStoreDataSourceImpl implements PurchaseStoreDataSource {
  static const Set<String> productIds = {'platinum_plan', 'standard_plan'};

  InAppPurchase get _store => InAppPurchase.instance;

  InAppPurchaseAndroidPlatformAddition get _android =>
      _store.getPlatformAddition<InAppPurchaseAndroidPlatformAddition>();

  @override
  Stream<List<StorePurchase>> get purchaseUpdates => _store.purchaseStream.map(
    (updates) => [for (final details in updates) _toStorePurchase(details)],
  );

  static StorePurchase _toStorePurchase(
    PurchaseDetails details, {
    String? purchaseId,
  }) => StorePurchase(
    productId: details.productID,
    status: switch (details.status) {
      PurchaseStatus.pending => .pending,
      PurchaseStatus.purchased => .purchased,
      PurchaseStatus.restored => .restored,
      PurchaseStatus.error => .error,
      PurchaseStatus.canceled => .canceled,
    },
    purchaseId: purchaseId ?? details.purchaseID,
    needsCompletion: details.pendingCompletePurchase,
    storeHandle: details,
  );

  @override
  Future<bool> buy(String productId) async {
    if (!await _store.isAvailable()) return false;
    final response = await _store.queryProductDetails(productIds);
    if (response.notFoundIDs.isNotEmpty) {
      log('Products missing in store: ${response.notFoundIDs}');
    }
    final product = response.productDetails
        .where((p) => p.id == productId)
        .firstOrNull;
    if (product == null) {
      log('Product $productId not found in store');
      return false;
    }
    return _store.buyConsumable(
      purchaseParam: PurchaseParam(productDetails: product),
    );
  }

  @override
  Future<void> complete(StorePurchase purchase) async {
    final details = purchase.storeHandle;
    if (details is PurchaseDetails) await _store.completePurchase(details);
  }

  @override
  Future<List<StorePurchase>> unconsumedPurchases() async {
    if (!Platform.isAndroid || !await _store.isAvailable()) return const [];
    final response = await _android.queryPastPurchases();
    if (response.error case final error?) {
      log('Querying past purchases failed: ${error.message}');
    }
    return [
      for (final details in response.pastPurchases)
        if (details.status == PurchaseStatus.purchased &&
            productIds.contains(details.productID))
          _toStorePurchase(
            details,
            // Test purchases may have no order id; the token is unique too.
            purchaseId: switch (details.purchaseID) {
              final id? when id.isNotEmpty => id,
              _ => details.verificationData.serverVerificationData,
            },
          ),
    ];
  }

  @override
  Future<void> consume(StorePurchase purchase) async {
    final details = purchase.storeHandle;
    if (!Platform.isAndroid || details is! PurchaseDetails) return;
    final result = await _android.consumePurchase(details);
    if (result.responseCode != BillingResponse.ok) {
      throw Exception(
        'Consuming ${purchase.productId} failed: ${result.responseCode} '
        '${result.debugMessage ?? ''}',
      );
    }
  }
}
