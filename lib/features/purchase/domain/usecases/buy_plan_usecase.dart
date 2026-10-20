import 'package:easy_birthday/features/event/data/models/plan_model.dart';
import 'package:easy_birthday/features/purchase/domain/repositories/purchase_repository.dart';

/// Opens the store to buy a plan. The result arrives later through the
/// app-wide purchase service, even if the page that started it is gone.
class BuyPlanUseCase {
  final PurchaseRepository repository;
  BuyPlanUseCase(this.repository);

  Future<bool> call(PlanModel plan) => repository.buyPlan(plan);
}
