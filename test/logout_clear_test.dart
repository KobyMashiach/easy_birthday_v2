import 'dart:io';

import 'package:easy_birthday/core/hive/hive_functions.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/features/settings/data/models/app_settings_model.dart';
import 'package:easy_birthday/features/user/data/models/persona_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce/hive.dart';

void main() {
  late Directory dir;

  setUp(() async {
    SessionService().reset();
    dir = await Directory.systemTemp.createTemp('hive_logout_test');
    Hive.init(dir.path);
    // Same typed boxes the app opens at startup.
    await Hive.openBox<AppSettingsModel>(AppSettingsModel.hiveKey);
    await Hive.openBox<PersonaModel>(PersonaModel.hiveKey);
    await Hive.openBox<PersonaModel>(PersonaModel.partnerHiveKey);
    final general = await Hive.openBox<String>('general');
    await general.add('old-event-id');
  });

  tearDown(() async {
    await Hive.close();
    await dir.delete(recursive: true);
  });

  test('logout clears every local box without throwing', () async {
    SessionService().event = null;
    await clearAllHiveBoxes();
    expect(Hive.box<String>('general').isEmpty, isTrue);
    expect(SessionService().partner, isNull);
  });
}
