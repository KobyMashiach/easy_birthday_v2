import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';

class ColorAdapter extends TypeAdapter<Color> {
  @override
  final typeId = 102;

  @override
  Color read(BinaryReader reader) {
    return Color(reader.readUint32());
  }

  @override
  void write(BinaryWriter writer, Color obj) {
    writer.writeUint32(obj.toARGB32());
  }
}
