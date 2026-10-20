import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/widgets/design_kit/app_toast.dart';
import 'package:easy_birthday/features/event/data/models/plan_model.dart';
import 'package:easy_birthday/features/onboarding/presentation/bloc/choose_plan_bloc.dart';
import 'package:easy_birthday/features/onboarding/presentation/widgets/choose_plan_card.dart';
import 'package:easy_birthday/core/widgets/general/appbar.dart';
import 'package:easy_birthday/core/widgets/general/app_buttons_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChoosePlanScreen extends StatefulWidget {
  final VoidCallback onContinue;
  final VoidCallback? onPrevious;

  /// Shown until the event's own plan is known.
  final PlanModel currentPlan;

  /// Called once a bought plan is written to the event (the purchase itself
  /// is handled app-wide, so it completes even if this page is gone).
  final void Function(String? planTitle) onPlanPurchase;
  final bool fromSettings;

  const ChoosePlanScreen({
    super.key,
    required this.onContinue,
    this.onPrevious,
    required this.currentPlan,
    required this.onPlanPurchase,
    this.fromSettings = false,
  });

  @override
  State<ChoosePlanScreen> createState() => _ChoosePlanScreenState();
}

class _ChoosePlanScreenState extends State<ChoosePlanScreen> {
  static final List<PlanModel> _plans = appPlans.values.toList();

  final PageController _pageController = PageController(
    viewportFraction: 0.7,
    initialPage: 1,
  );

  int _selectedPlanIndex = 1;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _listener(BuildContext context, ChoosePlanState state) {
    switch (state) {
      case PlanPurchased(:final productId):
        widget.onPlanPurchase(productId);
      case PurchaseAwaitingApproval():
        kheasydevAppToast(t.purchase_pending);
      case PurchaseSaved():
        kheasydevAppToast(t.purchase_saved_for_later);
      case ErrorMessage():
        kheasydevAppToast(t.purchase_failed);
      case Loaded():
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Inside the wizard, back goes to the previous step instead of leaving.
    return PopScope(
      canPop: widget.fromSettings,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) widget.onPrevious?.call();
      },
      child: BlocProvider(
        create: (context) =>
            ChoosePlanBloc.fromContext(context)..add(.init(widget.currentPlan)),
        child: Scaffold(
          appBar: widget.fromSettings ? appAppBar(title: t.change_plan) : null,
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: BlocConsumer<ChoosePlanBloc, ChoosePlanState>(
                listenWhen: (_, current) => current.isOneShot,
                buildWhen: (previous, current) =>
                    previous.currentPlan.title != current.currentPlan.title,
                listener: _listener,
                builder: (context, state) {
                  final bloc = context.read<ChoosePlanBloc>();
                  return PageView.builder(
                    itemCount: _plans.length,
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _selectedPlanIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      final bool isSelected = _selectedPlanIndex == index;
                      final plan = _plans[index];
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                        margin: const EdgeInsets.symmetric(horizontal: 8.0)
                            .copyWith(
                              top: isSelected ? 0 : 40,
                              bottom: isSelected ? 0 : 40,
                            ),
                        padding: EdgeInsets.all(isSelected ? 16.0 : 12.0),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.blueGrey : Colors.white,
                          borderRadius: BorderRadius.circular(24.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 8.0,
                              spreadRadius: 2.0,
                              offset: Offset(2.0, 2.0),
                            ),
                          ],
                        ),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _selectedPlanIndex = index;
                            });
                            _pageController.animateToPage(
                              index,
                              duration: const Duration(milliseconds: 800),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Opacity(
                            opacity: isSelected ? 1.0 : 0.3,
                            child: ChoosePlanCard(
                              plan: plan,
                              isSelected: isSelected,
                              currentPlan:
                                  state.currentPlan.title == plan.title,
                              onBuy: () => bloc.add(.buy(plan)),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          bottomNavigationBar: AppButtonsBottomNavigationBar(
            oneButton: widget.fromSettings,
            activeButtonText: !widget.fromSettings ? t.finish : t.cancel,
            activeButtonOnTap: widget.onContinue,
            inactiveButtonText: t.back,
            inactiveButtonOnTap: widget.onPrevious,
          ),
        ),
      ),
    );
  }
}
