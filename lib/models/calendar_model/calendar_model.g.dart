// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CalendarModelImpl _$$CalendarModelImplFromJson(Map<String, dynamic> json) =>
    _$CalendarModelImpl(
      startDate: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['startDate'], const DateConverter().fromJson),
      endDate: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['endDate'], const DateConverter().fromJson),
      dateEventMap: json['dateEventMap'] == null
          ? const {}
          : const DateEventMapConverter()
              .fromJson(json['dateEventMap'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CalendarModelImplToJson(_$CalendarModelImpl instance) =>
    <String, dynamic>{
      'startDate': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.startDate, const DateConverter().toJson),
      'endDate': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.endDate, const DateConverter().toJson),
      'dateEventMap':
          const DateEventMapConverter().toJson(instance.dateEventMap),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
