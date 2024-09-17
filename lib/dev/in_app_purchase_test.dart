import 'package:easy_birthday/widgets/design/buttons/app_button.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'dart:io';

const Set<String> _kIds = <String>{'platinum_plan'};

class InAppPurchaseTest extends StatefulWidget {
  const InAppPurchaseTest({super.key});

  @override
  State<InAppPurchaseTest> createState() => _InAppPurchaseTestState();
}

class _InAppPurchaseTestState extends State<InAppPurchaseTest> {
  List<ProductDetails> products = [];
  @override
  void initState() {
    loadProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: "In App Purchase"),
      body: Center(
        child: Column(
          children: [
            Text(products.toString()),
            AppButton(
              text: "purchase",
              onTap: () => purchaseProduct(),
            )
          ],
        ),
      ),
    );
  }

  void purchaseProduct() {
    final ProductDetails productDetails = products.first;
    final PurchaseParam purchaseParam =
        PurchaseParam(productDetails: productDetails);
    // if (_isConsumable(productDetails)) {
    // InAppPurchase.instance.buyConsumable(purchaseParam: purchaseParam);
    // } else {
    InAppPurchase.instance.buyNonConsumable(purchaseParam: purchaseParam);
    // }
  }

  void loadProducts() async {
    final ProductDetailsResponse response =
        await InAppPurchase.instance.queryProductDetails(_kIds);
    if (response.notFoundIDs.isNotEmpty) {
      // Handle the error.
    }
    products = response.productDetails;
  }
}
