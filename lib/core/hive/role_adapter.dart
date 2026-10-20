import 'package:easy_birthday/features/user/data/models/role_model.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

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
