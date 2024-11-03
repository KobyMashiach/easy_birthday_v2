import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/models/plan_model/plan_model.dart';
import 'package:easy_birthday/widgets/cards/choose_plan_card.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:easy_birthday/widgets/general/bottom_navigation_bars/app_buttons_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class ChoosePlanScreen extends StatefulWidget {
  final VoidCallback onContinue;
  final VoidCallback? onPrevious;
  final PlanModel currentPlan;
  final Function(String? planTitle) onPlanPurchase;
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
  _ChoosePlanScreenState createState() => _ChoosePlanScreenState();
}

class _ChoosePlanScreenState extends State<ChoosePlanScreen> {
  final PageController _pageController =
      PageController(viewportFraction: 0.7, initialPage: 1);

  int _selectedPlanIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.fromSettings ? appAppBar(title: t.change_plan) : null,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: PageView.builder(
            itemCount: appPlans.length,
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _selectedPlanIndex = index;
              });
            },
            itemBuilder: (context, index) {
              bool isSelected = _selectedPlanIndex == index;
              final currentPlan = appPlans.entries.elementAt(index).value;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                margin: const EdgeInsets.symmetric(horizontal: 8.0).copyWith(
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
                      _pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.easeInOut,
                      );
                    });
                  },
                  child: Opacity(
                    opacity: isSelected ? 1.0 : 0.3,
                    child: ChoosePlanCard(
                      plan: currentPlan,
                      isSelected: isSelected,
                      currentPlan:
                          widget.currentPlan.title == currentPlan.title,
                      onPurchasePlan: widget.onPlanPurchase,
                    ),
                  ),
                ),
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
    );
  }
}
