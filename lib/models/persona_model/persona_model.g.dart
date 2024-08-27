// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'persona_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PersonaModelAdapter extends TypeAdapter<_$PersonaModelImpl> {
  @override
  final int typeId = 100;

  @override
  _$PersonaModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$PersonaModelImpl(
      name: fields[0] as String,
      phoneNumber: fields[1] as String,
      email: fields[2] as String?,
      canEdit: fields[3] as bool,
      age: fields[4] as int?,
      profileImage: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$PersonaModelImpl obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.phoneNumber)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.canEdit)
      ..writeByte(4)
      ..write(obj.age)
      ..writeByte(5)
      ..write(obj.profileImage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonaModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PersonaModelImpl _$$PersonaModelImplFromJson(Map<String, dynamic> json) =>
    _$PersonaModelImpl(
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String?,
      canEdit: json['canEdit'] as bool,
      age: (json['age'] as num?)?.toInt(),
      profileImage: json['profileImage'] as String?,
    );

Map<String, dynamic> _$$PersonaModelImplToJson(_$PersonaModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'canEdit': instance.canEdit,
      'age': instance.age,
      'profileImage': instance.profileImage,
    };
