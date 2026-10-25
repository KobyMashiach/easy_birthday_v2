// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'look_alike_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LookAlikeModel _$LookAlikeModelFromJson(Map<String, dynamic> json) =>
    _LookAlikeModel(
      childImageUrls:
          (json['childImageUrls'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
      ownerImageUrl: json['ownerImageUrl'] as String?,
      partnerImageUrl: json['partnerImageUrl'] as String?,
      ownerAnswers:
          (json['ownerAnswers'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
      partnerAnswers:
          (json['partnerAnswers'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
      lock: json['lock'] as bool? ?? false,
    );

Map<String, dynamic> _$LookAlikeModelToJson(_LookAlikeModel instance) =>
    <String, dynamic>{
      'childImageUrls': instance.childImageUrls,
      'ownerImageUrl': instance.ownerImageUrl,
      'partnerImageUrl': instance.partnerImageUrl,
      'ownerAnswers': instance.ownerAnswers,
      'partnerAnswers': instance.partnerAnswers,
      'lock': instance.lock,
    };
