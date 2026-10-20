// ignore_for_file: invalid_annotation_target

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_birthday/core/utils/general_functions.dart';
import 'package:easy_birthday/core/utils/converters/color_converter.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/features/event/data/models/event_converters_json.dart';
import 'package:easy_birthday/features/event/data/models/plan_model.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_model.freezed.dart';
part 'event_model.g.dart';

@freezed
sealed class EventModel with _$EventModel {
  factory EventModel({
    required String eventId,
    required List<String> users,
    @PlanConverter() required PlanModel planSubscribe,
    @ColorConverter() Color? appColor,
    List<String>? imagesUrl,
    String? greeting,
    @JsonKey(fromJson: timestampToDateTime, toJson: dateTimeToTimestamp)
    DateTime? partnerDateOfBirth,
    // Stored under the original (misspelled) key in Firestore.
    @JsonKey(name: 'choosenTexts') Map<String, String>? chosenTexts,
    @Default([]) @CategoryConverter() List<CategoryModel> categories,
    String? profileImageUrl,
  }) = _EventModel;

  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);
}
