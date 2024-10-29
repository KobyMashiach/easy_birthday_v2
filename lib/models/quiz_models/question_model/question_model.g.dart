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
      selectedOption:
          _$JsonConverterFromJson<Map<String, dynamic>, OptionModel>(
              json['selectedOption'], const OptionsConverter().fromJson),
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$QuestionModelImplToJson(_$QuestionModelImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'options': const ListOptionsConverter().toJson(instance.options),
      'partnerChoise': instance.partnerChoise,
      'isLocked': instance.isLocked,
      'selectedOption':
          _$JsonConverterToJson<Map<String, dynamic>, OptionModel>(
              instance.selectedOption, const OptionsConverter().toJson),
      'imageUrl': instance.imageUrl,
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
