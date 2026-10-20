import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/features/event/data/models/plan_model.dart';
import 'package:flutter/material.dart';

class ChoosePlanCard extends StatelessWidget {
  final PlanModel plan;
  final bool isSelected;
  final bool currentPlan;

  /// Starts buying [plan].
  final VoidCallback? onBuy;

  const ChoosePlanCard({
    super.key,
    required this.plan,
    required this.isSelected,
    this.onBuy,
    this.currentPlan = false,
  });

  @override
  Widget build(BuildContext context) {
    final features = plan.features;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          plan.displayTitle,
          style: AppTextStyle().bigTitle.copyWith(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          "${plan.price.toStringAsFixed(2)}₪",
          style: AppTextStyle().title.copyWith(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
        const SizedBox(height: 16.0),
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => _featureRow(features[index]),
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemCount: features.length,
          ),
        ),
        const SizedBox(height: 16.0),
        if (plan.isNotFree && !currentPlan) _cartButton(),
        if (currentPlan) _checkIcon(),
      ],
    );
  }

  Widget _checkIcon() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.greenAccent,
        borderRadius: BorderRadius.circular(30.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: const Icon(
        Icons.check,
        color: Colors.white,
      ),
    );
  }

  Widget _cartButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.pinkAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      ),
      onPressed: onBuy,
      child: const Icon(
        Icons.shopping_cart,
        color: Colors.white,
      ),
    );
  }

  Widget _featureRow(String feature) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Icon(
              Icons.check,
              color: isSelected ? Colors.pink : Colors.grey,
            ),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            flex: 8,
            child: Text(
              feature,
              style: AppTextStyle().smallDescription.copyWith(
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
