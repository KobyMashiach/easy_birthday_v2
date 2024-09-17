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
    Key? key,
    required this.plan,
    required this.isSelected,
    this.onPurchasePlan,
    this.currentPlan = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(plan.title,
            style: AppTextStyle().bigTitle.copyWith(
                  color: isSelected ? Colors.white : Colors.black,
                )),
        SizedBox(height: 8.0),
        Text("${plan.price.toStringAsFixed(2)}₪",
            style: AppTextStyle().title.copyWith(
                  color: isSelected ? Colors.white : Colors.black,
                )),
        SizedBox(height: 16.0),
        ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => futuresList(index),
            separatorBuilder: (context, index) => SizedBox(height: 12),
            itemCount: plan.features.length),
        Spacer(),
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
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Icon(
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
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      ),
      onPressed: () async {
        await PurchaseServices().purchaseProduct(plan);
        PurchaseServices(
          onPurchaseStatusChanged: (PurchaseStatus status, String productId) {
            if (status == PurchaseStatus.purchased) {
              log(productId);
              onPurchasePlan?.call(productId);
            } else if (status == PurchaseStatus.error) {
            } else if (status == PurchaseStatus.pending) {}
          },
        );
      },
      child: Icon(
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
          SizedBox(width: 8.0),
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
