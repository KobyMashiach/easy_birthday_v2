import 'dart:developer';

import 'package:easy_birthday/features/purchase/domain/repositories/purchase_repository.dart';
import 'package:easy_birthday/features/purchase/domain/usecases/apply_purchased_plans_usecase.dart';

/// Google Play: a paid plan left unconsumed (the app was killed before it
/// handled the purchase, or consuming it failed) is refunded after 3 days and
/// blocks buying that plan again, and Play never sends it to the app again.
/// Saves each one on the device like a delivered purchase (once per store
/// purchase, so it is never applied twice), then consumes it.
///
/// Returns the product ids saved now.
class RecoverUnconsumedPurchasesUseCase {
  final PurchaseRepository repository;
  RecoverUnconsumedPurchasesUseCase(this.repository);

  Future<List<String>> call() async {
    final saved = <String>[];
    for (final purchase in await repository.unconsumedPurchases()) {
      final productId = purchase.productId;
      if (planForProduct(productId) == null) continue;
      try {
        if (await repository.savePendingPurchaseOnce(purchase)) {
          saved.add(productId);
        }
      } catch (e) {
        // Not consumed, so it is found again next time.
        log('Saving unconsumed purchase $productId failed: $e');
        continue;
      }
      try {
        await repository.consumePurchase(purchase);
      } catch (e) {
        // Already saved (and marked), so the next attempt only consumes it.
        log('Consuming purchase $productId failed: $e');
      }
    }
    return saved;
  }
}
