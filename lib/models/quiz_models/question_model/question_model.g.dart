// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestionModelImpl _$$QuestionModelImplFromJson(Map<String, dynamic> json) =>
    _$QuestionModelImpl(
      text: json['text'] as String,
      options: const ListOptionsConverter().fromJson(json['options'] as List),
      partnerChoise: (json['partnerChoise'] as num?)?.toInt(),
      isLocked: json['isLocked'] as bool? ?? false,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$QuestionModelImplToJson(_$QuestionModelImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'options': const ListOptionsConverter().toJson(instance.options),
      'partnerChoise': instance.partnerChoise,
      'isLocked': instance.isLocked,
      'imageUrl': instance.imageUrl,
    };
