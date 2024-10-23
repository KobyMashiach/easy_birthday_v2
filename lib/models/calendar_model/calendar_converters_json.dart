import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_birthday/models/calendar_model/date_event_model/date_event_model.dart';
import 'package:json_annotation/json_annotation.dart';

class DateConverter implements JsonConverter<DateTime, Timestamp> {
  const DateConverter();

  @override
  DateTime fromJson(Timestamp timestamp) {
    return timestamp.toDate();
  }

  @override
  Timestamp toJson(DateTime date) {
    return Timestamp.fromDate(date);
  }
}

class DateEventConverter
    implements JsonConverter<DateEventModel, Map<String, dynamic>> {
  const DateEventConverter();

  @override
  DateEventModel fromJson(Map<String, dynamic> json) {
    return DateEventModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(DateEventModel event) {
    return event.toJson();
  }
}

class DateEventMapConverter
    implements
        JsonConverter<Map<DateTime, List<DateEventModel>>,
            Map<String, dynamic>> {
  const DateEventMapConverter();

  @override
  Map<DateTime, List<DateEventModel>> fromJson(Map<String, dynamic> json) {
    final DateConverter dateConverter = const DateConverter();
    return json.map(
      (key, value) => MapEntry(
        dateConverter
            .fromJson(Timestamp.fromMillisecondsSinceEpoch(int.parse(key))),
        (value as List<dynamic>)
            .map((e) => DateEventModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  @override
  Map<String, dynamic> toJson(
      Map<DateTime, List<DateEventModel>> dateEventMap) {
    final DateConverter dateConverter = const DateConverter();

    return dateEventMap.map(
      (key, value) => MapEntry(
        dateConverter.toJson(key).millisecondsSinceEpoch.toString(),
        value.map((e) => e.toJson()).toList(),
      ),
    );
  }
}
