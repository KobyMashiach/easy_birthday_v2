// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestionModelImpl _$$QuestionModelImplFromJson(Map<String, dynamic> json) =>
    _$QuestionModelImpl(
      text: json['text'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) => OptionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      isLocked: json['isLocked'] as bool? ?? false,
      selectedOption: json['selectedOption'] == null
          ? null
          : OptionModel.fromJson(
              json['selectedOption'] as Map<String, dynamic>),
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$QuestionModelImplToJson(_$QuestionModelImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'options': instance.options,
      'isLocked': instance.isLocked,
      'selectedOption': instance.selectedOption,
      'imageUrl': instance.imageUrl,
    };
