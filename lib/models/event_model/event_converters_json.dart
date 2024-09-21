import 'package:easy_birthday/models/category_model/category_model.dart';
import 'package:easy_birthday/models/plan_model/plan_model.dart';
import 'package:json_annotation/json_annotation.dart';

class PlanConverter implements JsonConverter<PlanModel, Map<String, dynamic>> {
  const PlanConverter();

  @override
  PlanModel fromJson(Map<String, dynamic> json) {
    return PlanModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(PlanModel plan) {
    return plan.toJson();
  }
}

class CategoryConverter
    implements JsonConverter<CategoryModel, Map<String, dynamic>> {
  const CategoryConverter();

  @override
  CategoryModel fromJson(Map<String, dynamic> json) {
    return CategoryModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(CategoryModel category) {
    return category.toJson();
  }
}
