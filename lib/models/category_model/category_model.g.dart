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
      titleAppear: json['titleAppear'] as String?,
    );

Map<String, dynamic> _$$CategoryModelImplToJson(_$CategoryModelImpl instance) =>
    <String, dynamic>{
      'categoryType': _$CategoryEnumEnumMap[instance.categoryType]!,
      'name': instance.name,
      'description': instance.description,
      'titleAppear': instance.titleAppear,
    };

const _$CategoryEnumEnumMap = {
  CategoryEnum.text: 'text',
  CategoryEnum.pictures: 'pictures',
  CategoryEnum.videos: 'videos',
  CategoryEnum.quizGame: 'quizGame',
};
