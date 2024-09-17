import 'dart:async';
import 'dart:developer';
import 'package:easy_birthday/models/plan_model/plan_model.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class PurchaseServices {
  Set<String> _kIds = <String>{'platinum_plan', 'standard_plan'};
  final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  late StreamSubscription<List<PurchaseDetails>> _subscription;
  final Function(PurchaseStatus status, String productId)?
      onPurchaseStatusChanged;

  PurchaseServices({this.onPurchaseStatusChanged}) {
    // Listen for purchase updates
    _subscription = _inAppPurchase.purchaseStream.listen(
      _onPurchaseUpdated,
      onDone: () {
        _subscription.cancel();
      },
      onError: (error) {
        log('dont found key');
      },
    );
  }

  Future<List<ProductDetails>> load() async {
    final ProductDetailsResponse response =
        await _inAppPurchase.queryProductDetails(_kIds);
    if (response.notFoundIDs.isNotEmpty) {
      log("missing a producs");
    }
    List<ProductDetails> products = response.productDetails;
    return products;
  }

  Future<void> purchaseProduct(PlanModel plan) async {
    final List<ProductDetails> products = await load();
    final ProductDetails productDetails = products.firstWhere(
        (loadedProduct) => loadedProduct.id == plan.productPurchaseName);
    final PurchaseParam purchaseParam =
        PurchaseParam(productDetails: productDetails);
    _inAppPurchase.buyConsumable(purchaseParam: purchaseParam);
  }

  void _onPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
    for (PurchaseDetails purchaseDetails in purchaseDetailsList) {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        onPurchaseStatusChanged?.call(
            PurchaseStatus.pending, purchaseDetails.productID);
      } else if (purchaseDetails.status == PurchaseStatus.purchased) {
        onPurchaseStatusChanged?.call(
            PurchaseStatus.purchased, purchaseDetails.productID);
      } else if (purchaseDetails.status == PurchaseStatus.error) {
        onPurchaseStatusChanged?.call(
            PurchaseStatus.error, purchaseDetails.productID);
      }

      if (purchaseDetails.pendingCompletePurchase) {
        InAppPurchase.instance.completePurchase(purchaseDetails);
      }
    }
  }

  void dispose() {
    _subscription.cancel();
  }
}
