import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:easy_birthday/models/persona_model/persona_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

part 'wear_os_categories_event.dart';
part 'wear_os_categories_state.dart';

class WearOsCategoriesBloc
    extends Bloc<WearOsCategoriesEvent, WearOsCategoriesState> {
  WearOsCategoriesBloc() : super(WearOsCategoriesInitial()) {
    on<WearOsCategoriesEventTest>(_wearOsCategoriesEventTest);
  }

  FutureOr<void> _wearOsCategoriesEventTest(WearOsCategoriesEventTest event,
      Emitter<WearOsCategoriesState> emit) async {
    if (!Hive.isBoxOpen(PersonaModel.hiveKey)) {
      await Hive.openBox<PersonaModel>(PersonaModel.hiveKey);
    }
    final box = Hive.box<PersonaModel>(PersonaModel.hiveKey);
    final persona = box.values.map((e) => e).toList();
    log(persona.toString());
  }
}
