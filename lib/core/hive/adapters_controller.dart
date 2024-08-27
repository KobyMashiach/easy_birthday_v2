import 'package:easy_birthday/models/persona_model/persona_model.dart';
import 'package:hive/hive.dart';

class AdaptersController {
  static void registerAdapters() {
    Hive.registerAdapter<PersonaModel>(PersonaModelAdapter());
  }
}
