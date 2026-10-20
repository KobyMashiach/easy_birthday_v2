import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_birthday/features/event/data/models/date_event_model.dart';
import 'package:json_annotation/json_annotation.dart';

/// Normalizes a calendar day to a UTC-midnight key, matching the
/// `DateTime.utc(y, m, d)` values TableCalendar produces, so map lookups
/// are consistent regardless of where the date came from.
DateTime calendarDayKey(DateTime day) =>
    DateTime.utc(day.year, day.month, day.day);

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

class DateEventMapConverter
    implements
        JsonConverter<
          Map<DateTime, List<DateEventModel>>,
          Map<String, dynamic>
        > {
  const DateEventMapConverter();

  @override
  Map<DateTime, List<DateEventModel>> fromJson(Map<String, dynamic> json) {
    final DateConverter dateConverter = const DateConverter();
    return json.map(
      (key, value) => MapEntry(
        // Keys are stored as UTC-midnight instants; read them back in UTC
        // so the local timezone can't shift the day.
        calendarDayKey(
          dateConverter
              .fromJson(Timestamp.fromMillisecondsSinceEpoch(int.parse(key)))
              .toUtc(),
        ),
        (value as List<dynamic>)
            .map((e) => DateEventModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  @override
  Map<String, dynamic> toJson(
    Map<DateTime, List<DateEventModel>> dateEventMap,
  ) {
    final DateConverter dateConverter = const DateConverter();

    return dateEventMap.map(
      (key, value) => MapEntry(
        dateConverter.toJson(key).millisecondsSinceEpoch.toString(),
        value.map((e) => e.toJson()).toList(),
      ),
    );
  }
}
