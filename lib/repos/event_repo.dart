import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_birthday/core/general_functions.dart';
import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/models/category_model/category_model.dart';
import 'package:easy_birthday/models/event_model/event_model.dart';
import 'package:easy_birthday/models/plan_model/plan_model.dart';
import 'package:easy_birthday/services/firebase/firestore_data.dart';

class EventRepo {
  // final CategoryModelDataSource dataSource;
  EventRepo();

  final collection = FirebaseFirestore.instance.collection('events');

  Future<EventModel?> getEventFromServer() async {
    if (globalUser.eventId != null) {
      final data = await firestoreGetDocValues(collection, globalUser.eventId!);
      return EventModel.fromJson(data);
    }
    return null;
  }

  void buildEvent() {
    String eventId = "";
    if (globalUser.eventId != null) {
      eventId = globalUser.eventId!;
    } else {
      eventId = getRandomString(15);
      globalUser = globalUser.copyWith(eventId: eventId);
      globalPartnerUser = globalPartnerUser!.copyWith(eventId: eventId);
    }
    EventModel event = EventModel(
        eventId: eventId,
        users: [globalUser.phoneNumber, globalPartnerUser!.phoneNumber],
        planSubscribe: appPlans.entries
            .firstWhere((plan) => plan.value.title == "Free")
            .value);
    globalEvent = event;
    firestoreNewDoc(collection, docName: eventId, values: event.toJson());
  }

  void updateEvent(EventModel event) {
    globalEvent = event;
    firestoreUpdateDoc(collection,
        docName: event.eventId, values: event.toJson());
  }

  CategoryModel addCategory(CategoryModel category) {
    final randomString = getRandomString(10);
    final newCategory = category.copyWith(id: randomString);
    final updatedCategories =
        List<CategoryModel>.from(globalEvent?.categories ?? [])
          ..add(newCategory);
    globalEvent = globalEvent!.copyWith(categories: updatedCategories);
    firestoreUpdateDoc(collection,
        docName: globalEvent!.eventId, values: globalEvent!.toJson());
    // dataSource.addNewCategory(category: category);
    return newCategory;
  }

  void updateCategory(CategoryModel newCategory) {
    final updatedCategories =
        List<CategoryModel>.from(globalEvent?.categories ?? []);

    final findedCategoryIndex = updatedCategories
        .indexWhere((category) => category.id == newCategory.id);

    if (findedCategoryIndex != -1) {
      updatedCategories[findedCategoryIndex] = newCategory;
      globalEvent = globalEvent!.copyWith(categories: updatedCategories);

      firestoreUpdateDoc(collection,
          docName: globalEvent!.eventId, values: globalEvent!.toJson());
      // dataSource.updateCategory(category: newCategory);
    } else {
      log("Category not found");
    }
  }

  void deleteCategory(CategoryModel deletedCategory) async {
    final updatedCategories =
        List<CategoryModel>.from(globalEvent?.categories ?? []);

    updatedCategories
        .removeWhere((category) => category.id == deletedCategory.id);

    globalEvent = globalEvent!.copyWith(categories: updatedCategories);

    firestoreUpdateDoc(collection,
        docName: globalEvent!.eventId, values: globalEvent!.toJson());
  }

  // PersonaModel getLocalPersona() {
  //   return localDB.getPersona();
  // }

  // PersonaModel? getLocalPartnerPersona() {
  //   return localDB.getPartner();
  // }

  // Future<PersonaModel> getPersona({required String phoneNumber}) async {
  //   final personaFirestore =
  //       await firestoreGetDocValues(collection, phoneNumber);
  //   final persona = PersonaModel.fromJson(personaFirestore);
  //   return persona;
  // }

  // Future<bool> checkIfHaveDetails({required String phoneNumber}) async {
  //   final personaExist =
  //       await firestoreCheckIfDocExists(collection, phoneNumber);
  //   return personaExist;
  // }

  // Future<void> updatePersona(PersonaModel persona) async {
  //   await localDB.updatePersona(persona: persona);
  //   final phoneExist =
  //       await firestoreCheckIfDocExists(collection, persona.phoneNumber);
  //   if (phoneExist) {
  //     firestoreUpdateDoc(collection, docName: persona.phoneNumber);
  //   }
  // }

  // Future<void> deletePersona({required String phoneNumber}) async {
  //   await localDB.deletePersona();
  //   final phoneExist = await firestoreCheckIfDocExists(collection, phoneNumber);
  //   if (phoneExist) {
  //     firestoreDeleteDoc(collection, docName: phoneNumber);
  //   }
  // }

  // Future<void> updatePartnerPersona(PersonaModel persona) async {
  //   await localDB.updatePartner(persona: persona);
  //   final phoneExist =
  //       await firestoreCheckIfDocExists(collection, persona.phoneNumber);
  //   if (!phoneExist) {
  //     firestoreNewDoc(collection,
  //         docName: persona.phoneNumber, values: persona.toJson());
  //   }
  // }
}
