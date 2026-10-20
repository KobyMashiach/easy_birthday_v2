import 'package:easy_birthday/features/purchase/data/models/store_purchase.dart';
import 'package:easy_birthday/features/purchase/domain/repositories/purchase_repository.dart';

class WatchStorePurchasesUseCase {
  final PurchaseRepository repository;
  WatchStorePurchasesUseCase(this.repository);

  Stream<StorePurchase> call() => repository.watchStorePurchases();
}
