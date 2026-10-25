// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'child_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChildModel _$ChildModelFromJson(Map<String, dynamic> json) => _ChildModel(
  id: json['id'] as String,
  name: json['name'] as String,
  dateOfBirth: const DateConverter().fromJson(json['dateOfBirth'] as Timestamp),
  gender: json['gender'] as String? ?? "female",
);

Map<String, dynamic> _$ChildModelToJson(_ChildModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'dateOfBirth': const DateConverter().toJson(instance.dateOfBirth),
      'gender': instance.gender,
    };
