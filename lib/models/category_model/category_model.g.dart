// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryModelImpl _$$CategoryModelImplFromJson(Map<String, dynamic> json) =>
    _$CategoryModelImpl(
      categoryType: $enumDecode(_$CategoryEnumEnumMap, json['categoryType']),
      name: json['name'] as String,
      description: json['description'] as String,
      id: json['id'] as String?,
      titleAppear: json['titleAppear'] as String?,
      text: json['text'] as String?,
      urls: (json['urls'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$CategoryModelImplToJson(_$CategoryModelImpl instance) =>
    <String, dynamic>{
      'categoryType': _$CategoryEnumEnumMap[instance.categoryType]!,
      'name': instance.name,
      'description': instance.description,
      'id': instance.id,
      'titleAppear': instance.titleAppear,
      'text': instance.text,
      'urls': instance.urls,
    };

const _$CategoryEnumEnumMap = {
  CategoryEnum.text: 'text',
  CategoryEnum.pictures: 'pictures',
  CategoryEnum.videos: 'videos',
  CategoryEnum.quizGame: 'quizGame',
};
