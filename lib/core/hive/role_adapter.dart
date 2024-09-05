import 'package:easy_birthday/models/persona_model/role_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class RoleModelAdapter extends TypeAdapter<RoleModel> {
  @override
  final int typeId = 103;

  @override
  RoleModel read(BinaryReader reader) {
    final index = reader.readByte();
    return RoleModel.values[index];
  }

  @override
  void write(BinaryWriter writer, RoleModel obj) {
    writer.writeByte(obj.index);
  }
}
