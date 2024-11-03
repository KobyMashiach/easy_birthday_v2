import 'package:easy_birthday/core/consts.dart';

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

  bool get isFree => title.toLowerCase() == "free";
  bool get isStandard => title.toLowerCase() == "standard";
  bool get isPlatinum => title.toLowerCase() == "platinum";
  bool get isNotFree => !isFree;
  bool get isNotStandard => !isStandard;
  bool get isNotPlatinum => !isPlatinum;
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
      'גלריית תמונות (עד $freeImagesLimit תמונות)',
    ],
  ),
  "standard": PlanModel(
    title: "Standard",
    price: 25,
    features: [
      'טקסט לברכה מרגשת - ניתן להשתמש בAI',
      'גלריית תמונות (עד $standardImagesLimit תמונות)',
      'גלריית סרטונים (עד $standardVideosLimit סרטונים)',
      'הפתעת יום הולדת - מסך נעול עד שתחליטו שאתם מעצבים',
      'משחק הזיכרון עם תמונות משותפות שלכם!',
      'ללא פרסומות',
    ],
    productPurchaseName: 'standard_plan',
  ),
  "platinum": PlanModel(
    title: "Platinum",
    price: 40,
    features: [
      'טקסט לברכה מרגשת - ניתן להשתמש בAI',
      'גלריית תמונות (עד $platinumImagesLimit תמונות)',
      'גלריית סרטונים (עד $platinumVideosLimit סרטונים)',
      'הפתעת יום הולדת - מסך נעול עד שתחליטו שאתם מעצבים',
      'משחק הזיכרון עם תמונות משותפות שלכם!',
      'משחק טריוויה כיפי ומאתגר',
      'בניית לו"ז ליום הולדת בלוח שנה משותף',
      'רשימת משאלות - תן גישה לפרטנר שלך לבקש 3 משאלות',
      'ללא פרסומות',
    ],
    productPurchaseName: 'platinum_plan',
  ),
};
