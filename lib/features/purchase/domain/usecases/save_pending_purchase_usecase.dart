import 'package:easy_birthday/features/purchase/domain/repositories/purchase_repository.dart';

class SavePendingPurchaseUseCase {
  final PurchaseRepository repository;
  SavePendingPurchaseUseCase(this.repository);

  Future<void> call(String productId) =>
      repository.savePendingPurchase(productId);
}
