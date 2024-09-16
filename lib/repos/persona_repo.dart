import 'dart:developer';

import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/core/hive/persona_data_source.dart';
import 'package:easy_birthday/models/persona_model/persona_model.dart';
import 'package:easy_birthday/models/persona_model/role_model.dart';
import 'package:easy_birthday/services/firebase/firestore_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PersonaRepo {
  PersonaRepo(this.localDB);
  final collection = FirebaseFirestore.instance.collection('users');
  final PersonaDataSource localDB;

  PersonaModel getLocalPersona() {
    return localDB.getPersona();
  }

  PersonaModel getLocalPartnerPersona() {
    return localDB.getPartner();
  }

  Future<PersonaModel> getPersona({required String phoneNumber}) async {
    final personaFirestore =
        await firestoreGetDocValues(collection, phoneNumber);
    final persona = PersonaModel.fromJson(personaFirestore);
    return persona;
  }

  Future<bool> checkIfHaveDetails({required String phoneNumber}) async {
    final personaExist =
        await firestoreCheckIfDocExists(collection, phoneNumber);
    return personaExist;
  }

  Future<dynamic> firstRegister(
      {required String phoneNumber, required String password}) async {
    globalUser = globalUser.copyWith(
        phoneNumber: phoneNumber, password: password, role: RoleModel.owner);
    firestoreNewDoc(collection,
        docName: phoneNumber, values: globalUser.toJson());
  }

  Future<void> updatePersona(PersonaModel persona) async {
    await localDB.updatePersona(persona: persona);
    final phoneExist =
        await firestoreCheckIfDocExists(collection, persona.phoneNumber);
    if (phoneExist) {
      firestoreUpdateDoc(collection, docName: persona.phoneNumber);
    }
  }

  Future<void> deletePersona({required String phoneNumber}) async {
    await localDB.deletePersona();
    final phoneExist = await firestoreCheckIfDocExists(collection, phoneNumber);
    if (phoneExist) {
      firestoreDeleteDoc(collection, docName: phoneNumber);
    }
  }

  Future<void> updatePartnerPersona(PersonaModel persona) async {
    await localDB.updatePartner(persona: persona);
    final phoneExist =
        await firestoreCheckIfDocExists(collection, persona.phoneNumber);
    if (!phoneExist) {
      firestoreNewDoc(collection,
          docName: persona.phoneNumber, values: persona.toJson());
    }
  }
}
