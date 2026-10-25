// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_capsule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TimeCapsuleModel _$TimeCapsuleModelFromJson(Map<String, dynamic> json) =>
    _TimeCapsuleModel(
      openDate: const DateConverter().fromJson(json['openDate'] as Timestamp),
      ownerLetter: json['ownerLetter'] as String?,
      partnerLetter: json['partnerLetter'] as String?,
    );

Map<String, dynamic> _$TimeCapsuleModelToJson(_TimeCapsuleModel instance) =>
    <String, dynamic>{
      'openDate': const DateConverter().toJson(instance.openDate),
      'ownerLetter': instance.ownerLetter,
      'partnerLetter': instance.partnerLetter,
    };
