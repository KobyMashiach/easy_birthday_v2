import 'package:easy_birthday/features/event/data/models/plan_model.dart';
import 'package:easy_birthday/features/event/domain/repositories/event_repository.dart';
import 'package:easy_birthday/features/purchase/domain/repositories/purchase_repository.dart';

/// The app plan sold in the store as [productId] (null for unknown ids).
PlanModel? planForProduct(String? productId) => productId == null
    ? null
    : appPlans.values
          .where((plan) => plan.productPurchaseName == productId)
          .firstOrNull;

typedef AppliedPlan = ({String productId, PlanModel plan});

/// Writes the signed-in user's paid plans (saved on the device) to their
/// event, then forgets them. With no event yet they stay saved for the next
/// attempt; a failed write throws and keeps them too.
class ApplyPurchasedPlansUseCase {
  final PurchaseRepository purchaseRepository;
  final EventRepository eventRepository;

  ApplyPurchasedPlansUseCase({
    required this.purchaseRepository,
    required this.eventRepository,
  });

  Future<List<AppliedPlan>> call() async {
    final pending = await purchaseRepository.pendingPurchases();
    if (pending.isEmpty) return const [];
    final event = await eventRepository.getEvent();
    if (event == null) return const [];

    final applied = <AppliedPlan>[
      for (final purchase in pending)
        if (planForProduct(purchase.productId) case final plan?)
          (productId: purchase.productId, plan: plan),
    ];
    // In purchase order, so the latest purchase is the plan that stays.
    if (applied.isNotEmpty) {
      await eventRepository.updatePlan(event, applied.last.plan);
    }
    await Future.wait(pending.map(purchaseRepository.removePendingPurchase));
    return applied;
  }
}
