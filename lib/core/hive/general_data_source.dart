import 'package:hive_flutter/hive_flutter.dart';

class GeneralDataSource {
  static const _boxKey = 'general';

  static Future initialise() async {
    if (!Hive.isBoxOpen(_boxKey)) {
      await Hive.openBox<String>(_boxKey);
    }
  }

  String? getEventId() {
    final box = Hive.box<String>(_boxKey);
    final eventId = box.values.map((e) => e).toList();
    return eventId.isNotEmpty ? eventId.first : null;
  }

  Future saveEventId({required String eventId}) async {
    final box = Hive.box<String>(_boxKey);
    box.clear();
    await box.add(eventId);
  }

  Future deleteEventId() async {
    final box = Hive.box<String>(_boxKey);
    box.clear();
  }
}
