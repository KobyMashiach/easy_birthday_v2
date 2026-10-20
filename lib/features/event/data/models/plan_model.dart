import 'package:easy_birthday/core/constants/app_constants.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';

class PlanModel {
  /// Stored in Firestore and compared in code ("Free"/"Standard"/"Platinum"),
  /// so it stays English. Show [displayTitle] instead.
  final String title;
  final double price;
  final String? productPurchaseName;

  PlanModel({
    required this.title,
    required this.price,
    this.productPurchaseName,
  });

  factory PlanModel.fromJson(Map<String, dynamic> json) {
    return PlanModel(
      title: json['title'] as String,
      // Firestore may hand back a whole number as int.
      price: (json['price'] as num).toDouble(),
      productPurchaseName: json['productPurchaseName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'price': price,
      // Older app versions require this field when reading the event.
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

  /// The plan's name in the app language.
  String get displayTitle => switch (this) {
    PlanModel(isPlatinum: true) => t.plan_platinum,
    PlanModel(isStandard: true) => t.plan_standard,
    PlanModel(isFree: true) => t.plan_free,
    _ => title,
  };

  /// What the plan includes, in the app language.
  List<String> get features => switch (this) {
    PlanModel(isFree: true) => [
      t.plan_feature_greeting,
      t.plan_feature_images(limit: freeImagesLimit),
    ],
    PlanModel(isStandard: true) => [
      t.plan_feature_greeting_ai,
      t.plan_feature_images(limit: standardImagesLimit),
      t.plan_feature_videos(limit: standardVideosLimit),
      t.plan_feature_surprise,
      t.plan_feature_memory_game,
      t.plan_feature_no_ads,
    ],
    PlanModel(isPlatinum: true) => [
      t.plan_feature_greeting_ai,
      t.plan_feature_images(limit: platinumImagesLimit),
      t.plan_feature_videos(limit: platinumVideosLimit),
      t.plan_feature_surprise,
      t.plan_feature_memory_game,
      t.plan_feature_trivia,
      t.plan_feature_calendar,
      t.plan_feature_wishes,
      t.plan_feature_no_ads,
    ],
    _ => const [],
  };
}

enum PlansEnum { free, standard, platinum }

PlanModel getPlan(PlansEnum planTitle) => appPlans[planTitle.name]!;

final Map<String, PlanModel> appPlans = {
  "free": PlanModel(title: "Free", price: 0),
  "standard": PlanModel(
    title: "Standard",
    price: 25,
    productPurchaseName: 'standard_plan',
  ),
  "platinum": PlanModel(
    title: "Platinum",
    price: 40,
    productPurchaseName: 'platinum_plan',
  ),
};
