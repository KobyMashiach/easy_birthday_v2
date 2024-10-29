class PlanModel {
  final String title;
  final double price;
  final List<String> features;
  final String? productPurchaseName;

  PlanModel({
    required this.title,
    required this.price,
    required this.features,
    this.productPurchaseName,
  });

  factory PlanModel.fromJson(Map<String, dynamic> json) {
    return PlanModel(
      title: json['title'] as String,
      price: json['price'] as double,
      features: List<String>.from(json['features']),
      productPurchaseName: json['productPurchaseName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'price': price,
      'features': features,
      'productPurchaseName': productPurchaseName,
    };
  }
}

enum PlansEnum { free, standard, platinum }

PlanModel getPlan(PlansEnum planTitle) {
  String planKey = planTitle.toString().split('.').last;
  return appPlans[planKey]!;
}

Map<String, PlanModel> appPlans = {
  "free": PlanModel(
    title: "Free",
    price: 0,
    features: [
      'טקסט לברכה מרגשת',
      'גלריית תמונות (עד 30 תמונות)',
    ],
  ),
  "standard": PlanModel(
    title: "Standard",
    price: 25,
    features: [
      'טקסט לברכה מרגשת - ניתן להשתמש בAI',
      'גלריית תמונות (עד 60 תמונות)',
      'גלריית סרטונים (עד 5 סרטונים)',
      'ללא פרסומות',
    ],
    productPurchaseName: 'standard_plan',
  ),
  "platinum": PlanModel(
    title: "Platinum",
    price: 40,
    features: [
      'טקסט לברכה מרגשת - ניתן להשתמש בAI',
      'גלריית תמונות (ללא הגבלה)',
      'גלריית סרטונים (עד 15 סרטונים)',
      'משחק טריוויה כיפי ומאתגר',
      'ללא פרסומות',
    ],
    productPurchaseName: 'platinum_plan',
  ),
};
