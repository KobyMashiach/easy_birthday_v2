// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppSettingsModelAdapter extends TypeAdapter<_$AppSettingsModelImpl> {
  @override
  final int typeId = 101;

  @override
  _$AppSettingsModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$AppSettingsModelImpl(
      appColor: fields[0] as Color,
    );
  }

  @override
  void write(BinaryWriter writer, _$AppSettingsModelImpl obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.appColor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppSettingsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppSettingsModelImpl _$$AppSettingsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AppSettingsModelImpl(
      appColor:
          const ColorConverter().fromJson((json['appColor'] as num).toInt()),
    );

Map<String, dynamic> _$$AppSettingsModelImplToJson(
        _$AppSettingsModelImpl instance) =>
    <String, dynamic>{
      'appColor': const ColorConverter().toJson(instance.appColor),
    };
