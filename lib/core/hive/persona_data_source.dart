import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/models/persona_model/persona_model.dart';
import 'package:easy_birthday/models/persona_model/role_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class PersonaDataSource {
  static const _boxKey = PersonaModel.hiveKey;
  static const _partnerBoxKey = "Partner${PersonaModel.hiveKey}";

  static Future initialise() async {
    if (!Hive.isBoxOpen(_boxKey)) {
      await Hive.openBox<PersonaModel>(_boxKey);
    }
    if (!Hive.isBoxOpen(_partnerBoxKey)) {
      await Hive.openBox<PersonaModel>(_partnerBoxKey);
    }
  }

  Future addNewPersona({required PersonaModel persona}) async {
    final box = Hive.box<PersonaModel>(_boxKey);
    await box.add(persona);
    globalUser = persona;
  }

  Future updatePersona({required PersonaModel persona}) async {
    final box = Hive.box<PersonaModel>(_boxKey);
    box.clear();
    await box.add(persona);
    globalUser = persona;
  }

  PersonaModel getPersona() {
    final box = Hive.box<PersonaModel>(_boxKey);
    final persona = box.values.map((e) => e).toList();
    return persona.isNotEmpty ? persona.first : globalUser;
  }

  Future deletePersona() async {
    final box = Hive.box<PersonaModel>(_boxKey);
    await box.clear();
    globalUser = PersonaModel(
        name: "",
        phoneNumber: "",
        password: "",
        role: RoleModel.partner,
        registerComplete: false);
  }

  Future addNewPartner({required PersonaModel persona}) async {
    final box = Hive.box<PersonaModel>(_partnerBoxKey);
    await box.add(persona);
    globalPartnerUser = persona;
  }

  Future updatePartner({required PersonaModel persona}) async {
    final box = Hive.box<PersonaModel>(_partnerBoxKey);
    box.clear();
    await box.add(persona);
    globalPartnerUser = persona;
  }

  PersonaModel? getPartner() {
    final box = Hive.box<PersonaModel>(_partnerBoxKey);
    final persona = box.values.map((e) => e).toList();
    return persona.isNotEmpty ? persona.first : null;
  }

  Future deleteAllPartners() async {
    final box = Hive.box<PersonaModel>(_partnerBoxKey);
    await box.clear();
    globalPartnerUser = null;
  }

  Future<bool> hasPartners() async {
    final box = Hive.box<PersonaModel>(_partnerBoxKey);
    return box.isNotEmpty;
  }

  Future<List<PersonaModel>> getAllPartners() async {
    final box = Hive.box<PersonaModel>(_partnerBoxKey);
    return box.values.toList();
  }
}
