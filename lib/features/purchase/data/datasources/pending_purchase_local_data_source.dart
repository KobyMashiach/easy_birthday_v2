import 'package:easy_birthday/features/purchase/data/models/pending_purchase.dart';
import 'package:hive_ce/hive.dart';

abstract class PendingPurchaseLocalDataSource {
  /// In the order they were bought.
  Future<List<PendingPurchase>> getAll();
  Future<void> add(PendingPurchase purchase);
  Future<void> remove(PendingPurchase purchase);

  /// Whether the store purchase [purchaseId] was already saved here once.
  Future<bool> wasSaved(String purchaseId);
  Future<void> markSaved(String purchaseId);
}

/// Paid plans survive an app restart here until they reach the event (on
/// Android the store consumes a purchase before the app sees it, so it is
/// never delivered again).
class PendingPurchaseLocalDataSourceImpl
    implements PendingPurchaseLocalDataSource {
  static const boxName = 'PendingPurchases';

  /// Store ids of purchases already saved, so a purchase the store keeps
  /// returning (not consumed yet) is never applied twice.
  static const savedIdsBoxName = 'SavedStorePurchases';

  static Future<Box<String>> _open(String name) async => Hive.isBoxOpen(name)
      ? Hive.box<String>(name)
      : Hive.openBox<String>(name);

  Future<Box<String>> get _box => _open(boxName);

  @override
  Future<List<PendingPurchase>> getAll() async {
    final box = await _box;
    return [
      for (final key in box.keys)
        if (box.get(key) case final value?) PendingPurchase.decode(key, value),
    ];
  }

  @override
  Future<void> add(PendingPurchase purchase) async {
    await (await _box).add(purchase.encode());
  }

  @override
  Future<void> remove(PendingPurchase purchase) async {
    if (purchase.key == null) return;
    await (await _box).delete(purchase.key);
  }

  @override
  Future<bool> wasSaved(String purchaseId) async =>
      (await _open(savedIdsBoxName)).values.contains(purchaseId);

  @override
  Future<void> markSaved(String purchaseId) async {
    await (await _open(savedIdsBoxName)).add(purchaseId);
  }
}
