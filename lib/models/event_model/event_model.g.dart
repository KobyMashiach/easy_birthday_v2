// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EventModelAdapter extends TypeAdapter<_$EventModelImpl> {
  @override
  final int typeId = 100;

  @override
  _$EventModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$EventModelImpl(
      eventId: fields[0] as String,
      users: (fields[1] as List).cast<String>(),
      planSubscribe: fields[2] as PlanModel,
      appColor: fields[3] as Color?,
      imagesUrl: (fields[4] as List?)?.cast<String>(),
      greeting: fields[5] as String?,
      partnerDateOfBirth: fields[6] as DateTime?,
      choosenTexts: (fields[7] as Map?)?.cast<String, String>(),
      categories: (fields[8] as List).cast<CategoryModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$EventModelImpl obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.eventId)
      ..writeByte(2)
      ..write(obj.planSubscribe)
      ..writeByte(3)
      ..write(obj.appColor)
      ..writeByte(5)
      ..write(obj.greeting)
      ..writeByte(6)
      ..write(obj.partnerDateOfBirth)
      ..writeByte(1)
      ..write(obj.users)
      ..writeByte(4)
      ..write(obj.imagesUrl)
      ..writeByte(7)
      ..write(obj.choosenTexts)
      ..writeByte(8)
      ..write(obj.categories);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventModelImpl _$$EventModelImplFromJson(Map<String, dynamic> json) =>
    _$EventModelImpl(
      eventId: json['eventId'] as String,
      users: (json['users'] as List<dynamic>).map((e) => e as String).toList(),
      planSubscribe: const PlanConverter()
          .fromJson(json['planSubscribe'] as Map<String, dynamic>),
      appColor: _$JsonConverterFromJson<int, Color>(
          json['appColor'], const ColorConverter().fromJson),
      imagesUrl: (json['imagesUrl'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      greeting: json['greeting'] as String?,
      partnerDateOfBirth:
          timestampToDateTime(json['partnerDateOfBirth'] as Timestamp?),
      choosenTexts: (json['choosenTexts'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) =>
                  const CategoryConverter().fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$EventModelImplToJson(_$EventModelImpl instance) =>
    <String, dynamic>{
      'eventId': instance.eventId,
      'users': instance.users,
      'planSubscribe': const PlanConverter().toJson(instance.planSubscribe),
      'appColor': _$JsonConverterToJson<int, Color>(
          instance.appColor, const ColorConverter().toJson),
      'imagesUrl': instance.imagesUrl,
      'greeting': instance.greeting,
      'partnerDateOfBirth': dateTimeToTimestamp(instance.partnerDateOfBirth),
      'choosenTexts': instance.choosenTexts,
      'categories':
          instance.categories.map(const CategoryConverter().toJson).toList(),
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
