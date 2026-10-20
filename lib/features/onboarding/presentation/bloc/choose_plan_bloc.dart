import 'dart:async';

import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/features/event/data/models/plan_model.dart';
import 'package:easy_birthday/features/purchase/data/models/purchase_outcome.dart';
import 'package:easy_birthday/features/purchase/domain/usecases/buy_plan_usecase.dart';
import 'package:easy_birthday/features/purchase/domain/usecases/watch_purchase_outcomes_usecase.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'choose_plan_bloc.freezed.dart';

@freezed
sealed class ChoosePlanEvent with _$ChoosePlanEvent {
  /// [fallbackPlan] is shown while there is no event yet.
  const factory ChoosePlanEvent.init(PlanModel fallbackPlan) = _Init;
  const factory ChoosePlanEvent.buy(PlanModel plan) = _Buy;
  const factory ChoosePlanEvent.purchaseUpdated(PurchaseOutcome outcome) =
      _PurchaseUpdated;
}

@Freezed(equal: false)
sealed class ChoosePlanState with _$ChoosePlanState {
  const factory ChoosePlanState.loaded(PlanModel currentPlan) = Loaded;
  const factory ChoosePlanState.planPurchased(
    PlanModel currentPlan,
    String productId,
  ) = PlanPurchased;
  const factory ChoosePlanState.purchaseAwaitingApproval(
    PlanModel currentPlan,
  ) = PurchaseAwaitingApproval;
  const factory ChoosePlanState.purchaseSaved(PlanModel currentPlan) =
      PurchaseSaved;
  const factory ChoosePlanState.errorMessage(
    PlanModel currentPlan,
    String error,
  ) = ErrorMessage;
}

extension ChoosePlanStateX on ChoosePlanState {
  bool get isOneShot => switch (this) {
    Loaded() => false,
    _ => true,
  };
}

/// Starts store purchases and follows them. Writing the paid plan to the
/// event is done app-wide (the purchase service), so leaving this page never
/// loses a purchase.
class ChoosePlanBloc extends Bloc<ChoosePlanEvent, ChoosePlanState> {
  final BuyPlanUseCase buyPlanUseCase;
  final WatchPurchaseOutcomesUseCase watchPurchaseOutcomesUseCase;

  ChoosePlanBloc({
    required this.buyPlanUseCase,
    required this.watchPurchaseOutcomesUseCase,
  }) : super(.loaded(getPlan(PlansEnum.free))) {
    on<_Init>(_init);
    on<_Buy>(_buy);
    on<_PurchaseUpdated>(_purchaseUpdated);
  }

  factory ChoosePlanBloc.fromContext(BuildContext context) => ChoosePlanBloc(
    buyPlanUseCase: context.read<BuyPlanUseCase>(),
    watchPurchaseOutcomesUseCase: context.read<WatchPurchaseOutcomesUseCase>(),
  );

  StreamSubscription<PurchaseOutcome>? _outcomes;
  bool _starting = false;

  FutureOr<void> _init(_Init event, Emitter<ChoosePlanState> emit) {
    emit(.loaded(SessionService().event?.planSubscribe ?? event.fallbackPlan));
    _outcomes ??= watchPurchaseOutcomesUseCase().listen(
      (outcome) => add(.purchaseUpdated(outcome)),
    );
  }

  FutureOr<void> _buy(_Buy event, Emitter<ChoosePlanState> emit) async {
    // One store sheet at a time (double taps).
    if (_starting) return;
    _starting = true;
    try {
      final started = await buyPlanUseCase(event.plan);
      if (!started) {
        emit(.errorMessage(state.currentPlan, 'The store is not available'));
      }
    } catch (e) {
      debugPrint('Starting the purchase failed: $e');
      emit(.errorMessage(state.currentPlan, e.toString()));
    } finally {
      _starting = false;
    }
  }

  FutureOr<void> _purchaseUpdated(
    _PurchaseUpdated event,
    Emitter<ChoosePlanState> emit,
  ) {
    final current = state.currentPlan;
    switch (event.outcome) {
      case PurchaseApplied(:final productId, :final plan):
        emit(.planPurchased(plan, productId));
      case PurchasePending():
        emit(.purchaseAwaitingApproval(current));
      case PurchaseSavedForLater():
        emit(.purchaseSaved(current));
      case PurchaseFailed(:final productId):
        emit(.errorMessage(current, 'Purchase of $productId failed'));
      case PurchaseCanceled():
        break;
    }
  }

  @override
  Future<void> close() async {
    await _outcomes?.cancel();
    return super.close();
  }
}
