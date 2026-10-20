// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DateEventModel _$DateEventModelFromJson(Map<String, dynamic> json) =>
    _DateEventModel(
      time: const TimeOfDayConverter().fromJson(
        json['time'] as Map<String, dynamic>,
      ),
      description: json['description'] as String,
    );

Map<String, dynamic> _$DateEventModelToJson(_DateEventModel instance) =>
    <String, dynamic>{
      'time': const TimeOfDayConverter().toJson(instance.time),
      'description': instance.description,
    };
