import 'package:easy_birthday/core/errors/app_exception.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/features/event/data/models/plan_model.dart';
import 'package:easy_birthday/features/purchase/data/datasources/pending_purchase_local_data_source.dart';
import 'package:easy_birthday/features/purchase/data/datasources/purchase_store_data_source.dart';
import 'package:easy_birthday/features/purchase/data/models/pending_purchase.dart';
import 'package:easy_birthday/features/purchase/data/models/store_purchase.dart';
import 'package:easy_birthday/features/purchase/domain/repositories/purchase_repository.dart';

class PurchaseRepositoryImpl implements PurchaseRepository {
  final PurchaseStoreDataSource storeDataSource;
  final PendingPurchaseLocalDataSource localDataSource;

  PurchaseRepositoryImpl({
    required this.storeDataSource,
    required this.localDataSource,
  });

  String get _userPhone => SessionService().user.phoneNumber;

  @override
  Stream<StorePurchase> watchStorePurchases() =>
      storeDataSource.purchaseUpdates.expand((updates) => updates);

  @override
  Future<bool> buyPlan(PlanModel plan) {
    final productId =
        plan.productPurchaseName ??
        (throw const AppException(
          AppErrorType.invalidInput,
          message: 'This plan is not sold in the store',
        ));
    return storeDataSource.buy(productId);
  }

  @override
  Future<void> completePurchase(StorePurchase purchase) =>
      storeDataSource.complete(purchase);

  @override
  Future<List<StorePurchase>> unconsumedPurchases() =>
      storeDataSource.unconsumedPurchases();

  @override
  Future<void> consumePurchase(StorePurchase purchase) =>
      storeDataSource.consume(purchase);

  @override
  Future<void> savePendingPurchase(String productId) => localDataSource.add(
    PendingPurchase(productId: productId, ownerPhone: _userPhone),
  );

  @override
  Future<bool> savePendingPurchaseOnce(StorePurchase purchase) async {
    final id = purchase.purchaseId;
    if (id != null && await localDataSource.wasSaved(id)) return false;
    await savePendingPurchase(purchase.productId);
    if (id != null) await localDataSource.markSaved(id);
    return true;
  }

  @override
  Future<List<PendingPurchase>> pendingPurchases() async {
    final phone = _userPhone;
    if (phone.isEmpty) return const [];
    final all = await localDataSource.getAll();
    return all.where((purchase) => purchase.belongsTo(phone)).toList();
  }

  @override
  Future<void> removePendingPurchase(PendingPurchase purchase) =>
      localDataSource.remove(purchase);
}
