import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/models/persona_model/persona_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class PersonaDataSource {
  static const _boxKey = PersonaModel.hiveKey;

  static Future initialise() async {
    if (!Hive.isBoxOpen(_boxKey)) {
      await Hive.openBox<PersonaModel>(_boxKey);
    }
  }

  Future addNewPersona({required PersonaModel persona}) async {
    final box = Hive.box<PersonaModel>(_boxKey);
    await box.add(persona);
  }

  Future updatePersona({required PersonaModel persona}) async {
    final box = Hive.box<PersonaModel>(_boxKey);
    box.clear();
    await box.add(persona);
  }

  PersonaModel getPersona() {
    final box = Hive.box<PersonaModel>(_boxKey);
    final persona = box.values.map((e) => e).toList();

    return persona.isNotEmpty ? persona.first : globalUser;
  }

  Future clearPersona() async {
    final box = Hive.box<PersonaModel>(_boxKey);
    await box.clear();
  }
}
