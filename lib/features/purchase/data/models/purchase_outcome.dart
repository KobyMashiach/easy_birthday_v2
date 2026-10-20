import 'package:easy_birthday/features/event/data/models/plan_model.dart';

/// What happened to a purchase after the app processed the store's update.
sealed class PurchaseOutcome {
  final String productId;
  const PurchaseOutcome(this.productId);
}

/// The store is still waiting (e.g. a payment that needs approval).
final class PurchasePending extends PurchaseOutcome {
  const PurchasePending(super.productId);
}

/// The plan was written to the event.
final class PurchaseApplied extends PurchaseOutcome {
  final PlanModel plan;
  const PurchaseApplied(super.productId, this.plan);
}

/// Paid, and saved on the device; it is written to the event as soon as the
/// event exists / can be reached.
final class PurchaseSavedForLater extends PurchaseOutcome {
  const PurchaseSavedForLater(super.productId);
}

final class PurchaseFailed extends PurchaseOutcome {
  const PurchaseFailed(super.productId);
}

final class PurchaseCanceled extends PurchaseOutcome {
  const PurchaseCanceled(super.productId);
}
