import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_birthday/models/calendar_model/calendar_converters_json.dart';
import 'package:easy_birthday/models/calendar_model/date_event_model/date_event_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_model.freezed.dart';
part 'calendar_model.g.dart';

@freezed
class CalendarModel with _$CalendarModel {
  const factory CalendarModel({
    @DateConverter() DateTime? startDate,
    @DateConverter() DateTime? endDate,
    @DateEventMapConverter()
    @Default({})
    Map<DateTime, List<DateEventModel>> dateEventMap,
  }) = _CalendarModel;

  factory CalendarModel.fromJson(Map<String, dynamic> json) =>
      _$CalendarModelFromJson(json);
}
