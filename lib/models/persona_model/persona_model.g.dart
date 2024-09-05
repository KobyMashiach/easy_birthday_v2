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
      password: fields[2] as String,
      role: fields[3] as RoleModel,
      age: fields[4] as int?,
      profileImage: fields[5] as String?,
      gender: fields[6] as String,
      partnerGender: fields[7] as String?,
      registerComplete: fields[8] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, _$PersonaModelImpl obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.phoneNumber)
      ..writeByte(2)
      ..write(obj.password)
      ..writeByte(3)
      ..write(obj.role)
      ..writeByte(4)
      ..write(obj.age)
      ..writeByte(5)
      ..write(obj.profileImage)
      ..writeByte(6)
      ..write(obj.gender)
      ..writeByte(7)
      ..write(obj.partnerGender)
      ..writeByte(8)
      ..write(obj.registerComplete);
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
      password: json['password'] as String,
      role: const RoleModelConverter().fromJson(json['role'] as String),
      age: (json['age'] as num?)?.toInt(),
      profileImage: json['profileImage'] as String?,
      gender: json['gender'] as String? ?? "male",
      partnerGender: json['partnerGender'] as String?,
      registerComplete: json['registerComplete'] as bool,
    );

Map<String, dynamic> _$$PersonaModelImplToJson(_$PersonaModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'password': instance.password,
      'role': const RoleModelConverter().toJson(instance.role),
      'age': instance.age,
      'profileImage': instance.profileImage,
      'gender': instance.gender,
      'partnerGender': instance.partnerGender,
      'registerComplete': instance.registerComplete,
    };
