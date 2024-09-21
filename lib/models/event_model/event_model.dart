// ignore_for_file: invalid_annotation_target

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_birthday/core/general_functions.dart';
import 'package:easy_birthday/models/app_settings_model/color_converter.dart';
import 'package:easy_birthday/models/category_model/category_model.dart';
import 'package:easy_birthday/models/event_model/event_converters_json.dart';
import 'package:easy_birthday/models/plan_model/plan_model.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'event_model.freezed.dart';
part 'event_model.g.dart';

@freezed
class EventModel with _$EventModel {
  static const String hiveKey = 'eventModel';
  @HiveType(typeId: 100, adapterName: 'EventModelAdapter')
  factory EventModel({
    @HiveField(0) required String eventId,
    @HiveField(1) required List<String> users,
    @HiveField(2) @PlanConverter() required PlanModel planSubscribe,
    @HiveField(3) @ColorConverter() Color? appColor,
    @HiveField(4) List<String>? imagesUrl,
    @HiveField(5) String? greeting,
    @HiveField(6)
    @JsonKey(fromJson: timestampToDateTime, toJson: dateTimeToTimestamp)
    DateTime? partnerDateOfBirth,
    @HiveField(7) Map<String, String>? choosenTexts,
    @HiveField(8)
    @Default([])
    @CategoryConverter()
    List<CategoryModel> categories,
  }) = _EventModel;

  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);
}
