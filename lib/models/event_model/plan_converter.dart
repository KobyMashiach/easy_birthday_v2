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
