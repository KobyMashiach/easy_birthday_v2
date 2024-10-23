import 'package:easy_birthday/models/calendar_model/date_event_model/date_event_converters_json.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'date_event_model.freezed.dart';
part 'date_event_model.g.dart';

@freezed
class DateEventModel with _$DateEventModel {
  const factory DateEventModel({
    @TimeOfDayConverter() required TimeOfDay time,
    required String description,
  }) = _DateEventModel;

  factory DateEventModel.fromJson(Map<String, dynamic> json) =>
      _$DateEventModelFromJson(json);
}
