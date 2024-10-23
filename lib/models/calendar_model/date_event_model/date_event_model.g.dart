// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DateEventModelImpl _$$DateEventModelImplFromJson(Map<String, dynamic> json) =>
    _$DateEventModelImpl(
      time: const TimeOfDayConverter()
          .fromJson(json['time'] as Map<String, dynamic>),
      description: json['description'] as String,
    );

Map<String, dynamic> _$$DateEventModelImplToJson(
        _$DateEventModelImpl instance) =>
    <String, dynamic>{
      'time': const TimeOfDayConverter().toJson(instance.time),
      'description': instance.description,
    };
