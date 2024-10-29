// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryModelAdapter extends TypeAdapter<_$CategoryModelImpl> {
  @override
  final int typeId = 104;

  @override
  _$CategoryModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$CategoryModelImpl(
      categoryType: fields[0] as CategoryEnum,
      name: fields[1] as String,
      description: fields[2] as String,
      id: fields[3] as String?,
      titleAppear: fields[4] as String?,
      text: fields[5] as String?,
      urls: (fields[6] as List?)?.cast<String>(),
      lock: fields[7] as bool,
      supriseMap: (fields[8] as Map?)?.map((dynamic k, dynamic v) =>
          MapEntry(k as int, (v as Map).cast<String, String>())),
      wishesList: fields[9] as WishesModel?,
      calendarEvents: fields[10] as CalendarModel?,
      quizGame: (fields[11] as List?)?.cast<QuestionModel>(),
      quizGameScore: fields[12] as int,
      inPlan: fields[13] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$CategoryModelImpl obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.categoryType)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.titleAppear)
      ..writeByte(5)
      ..write(obj.text)
      ..writeByte(7)
      ..write(obj.lock)
      ..writeByte(9)
      ..write(obj.wishesList)
      ..writeByte(10)
      ..write(obj.calendarEvents)
      ..writeByte(12)
      ..write(obj.quizGameScore)
      ..writeByte(13)
      ..write(obj.inPlan)
      ..writeByte(6)
      ..write(obj.urls)
      ..writeByte(8)
      ..write(obj.supriseMap)
      ..writeByte(11)
      ..write(obj.quizGame);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
      quizGameScore: (json['quizGameScore'] as num?)?.toInt() ?? 0,
      inPlan: json['inPlan'] as String? ?? "Free",
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
      'quizGameScore': instance.quizGameScore,
      'inPlan': instance.inPlan,
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
