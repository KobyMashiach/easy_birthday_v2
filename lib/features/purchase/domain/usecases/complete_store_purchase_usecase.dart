import 'package:easy_birthday/features/purchase/data/models/store_purchase.dart';
import 'package:easy_birthday/features/purchase/domain/repositories/purchase_repository.dart';

class CompleteStorePurchaseUseCase {
  final PurchaseRepository repository;
  CompleteStorePurchaseUseCase(this.repository);

  Future<void> call(StorePurchase purchase) =>
      repository.completePurchase(purchase);
}
