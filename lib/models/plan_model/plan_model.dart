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

Map<String, PlanModel> appPlans = {
  "Free": PlanModel(
    title: "Free",
    price: 0,
    features: [
      'גלריית תמונות (עד 30 תמונות)',
      'טקסט לברכה מרגשת',
      'גלריית מוסיקה מיוטיוב',
    ],
  ),
  "Standard": PlanModel(
    title: "Standard",
    price: 25,
    features: [
      'גלריית תמונות (עד 60 תמונות)',
      'טקסט לברכה מרגשת',
      'גלריית מוסיקה מיוטיוב',
      'ללא פרסומות',
    ],
    productPurchaseName: 'standard_plan',
  ),
  "Platinum": PlanModel(
    title: "Platinum",
    price: 40,
    features: [
      'גלריית תמונות (ללא הגבלה)',
      'טקסט לברכה מרגשת',
      'גלריית מוסיקה מיוטיוב',
      'משחק טריוויה כיפי ומאתגר',
      'ללא פרסומות',
    ],
    productPurchaseName: 'platinum_plan',
  ),
};
