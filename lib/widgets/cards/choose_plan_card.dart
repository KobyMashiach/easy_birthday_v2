import 'dart:developer';

import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/models/plan_model/plan_model.dart';
import 'package:easy_birthday/services/purchase_services.dart';
import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class ChoosePlanCard extends StatelessWidget {
  final PlanModel plan;
  final bool isSelected;
  final bool currentPlan;
  final Function(String?)? onPurchasePlan;

  const ChoosePlanCard({
    super.key,
    required this.plan,
    required this.isSelected,
    this.onPurchasePlan,
    this.currentPlan = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          plan.title,
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
            itemBuilder: (context, index) => futuresList(index),
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemCount: plan.features.length,
          ),
        ),
        const SizedBox(height: 16.0),
        if (plan.title != "Free" && !currentPlan) cartButton(),
        if (currentPlan) checkIcon(),
      ],
    );
  }

  Widget checkIcon() {
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

  ElevatedButton cartButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.pinkAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      ),
      onPressed: () async {
        await PurchaseServices().purchaseProduct(plan);
        PurchaseServices(
          onPurchaseStatusChanged: (PurchaseStatus status, String productId) {
            if (status == PurchaseStatus.purchased) {
              log(productId);
              onPurchasePlan?.call(productId);
            } else if (status == PurchaseStatus.error) {
              // Handle error
            } else if (status == PurchaseStatus.pending) {
              // Handle pending
            }
          },
        );
      },
      child: const Icon(
        Icons.shopping_cart,
        color: Colors.white,
      ),
    );
  }

  Padding futuresList(int index) {
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
              plan.features[index],
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
