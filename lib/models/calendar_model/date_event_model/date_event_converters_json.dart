import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

class TimeOfDayConverter implements JsonConverter<TimeOfDay, Map<String, int>> {
  const TimeOfDayConverter();

  @override
  TimeOfDay fromJson(Map<String, int> json) {
    return TimeOfDay(hour: json['hour']!, minute: json['minute']!);
  }

  @override
  Map<String, int> toJson(TimeOfDay time) {
    return {'hour': time.hour, 'minute': time.minute};
  }
}
