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
      lock: json['lock'] as bool? ?? false,
      supriseMap: (json['supriseMap'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(int.parse(k), Map<String, String>.from(e as Map)),
      ),
      wishesList: _$JsonConverterFromJson<Map<String, dynamic>, WishesModel>(
          json['wishesList'], const WishesConverter().fromJson),
      calendarEvents:
          _$JsonConverterFromJson<Map<String, dynamic>, CalendarModel>(
              json['calendarEvents'], const CalendarModelConverter().fromJson),
      quizGame: _$JsonConverterFromJson<List<dynamic>, List<QuestionModel>>(
          json['quizGame'], const QuestionModelListConverter().fromJson),
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
      'lock': instance.lock,
      'supriseMap':
          instance.supriseMap?.map((k, e) => MapEntry(k.toString(), e)),
      'wishesList': _$JsonConverterToJson<Map<String, dynamic>, WishesModel>(
          instance.wishesList, const WishesConverter().toJson),
      'calendarEvents':
          _$JsonConverterToJson<Map<String, dynamic>, CalendarModel>(
              instance.calendarEvents, const CalendarModelConverter().toJson),
      'quizGame': _$JsonConverterToJson<List<dynamic>, List<QuestionModel>>(
          instance.quizGame, const QuestionModelListConverter().toJson),
    };

const _$CategoryEnumEnumMap = {
  CategoryEnum.text: 'text',
  CategoryEnum.pictures: 'pictures',
  CategoryEnum.videos: 'videos',
  CategoryEnum.quizGame: 'quizGame',
  CategoryEnum.birthdayCalendar: 'birthdayCalendar',
  CategoryEnum.birthdaySuprise: 'birthdaySuprise',
  CategoryEnum.wishesList: 'wishesList',
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
