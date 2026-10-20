import 'package:easy_birthday/features/purchase/data/models/purchase_outcome.dart';
import 'package:easy_birthday/features/purchase/domain/services/purchase_service.dart';

/// What happens to purchases as the app-wide [PurchaseService] handles them.
class WatchPurchaseOutcomesUseCase {
  final PurchaseService purchaseService;
  WatchPurchaseOutcomesUseCase(this.purchaseService);

  Stream<PurchaseOutcome> call() => purchaseService.outcomes;
}
