import 'package:easy_birthday/core/hive/color_adapter.dart';
import 'package:easy_birthday/core/hive/role_adapter.dart';
import 'package:easy_birthday/features/settings/data/models/app_settings_model.dart';
import 'package:easy_birthday/features/user/data/models/persona_model.dart';
import 'package:easy_birthday/features/wear_os/data/datasources/wear_os_local_data_source.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_ce/hive.dart';

class AdaptersController {
  /// Registers every adapter, then opens all boxes in parallel (they are
  /// independent files, so this shortens startup).
  static Future<void> registerAdapters() async {
    // hive_ce ships its own Color adapter (typeId 200); keep ours (102) so the
    // on-disk format stays identical to earlier app versions.
    Hive.registerAdapter<Color>(ColorAdapter(), override: true);
    _registerAdapter(RoleModelAdapter());
    _registerAdapter(PersonaModelAdapter());
    _registerAdapter(AppSettingsModelAdapter());

    await Future.wait([
      _openBox<PersonaModel>(PersonaModel.hiveKey),
      _openBox<PersonaModel>(PersonaModel.partnerHiveKey),
      _openBox<AppSettingsModel>(AppSettingsModel.hiveKey),
      _openBox<String>(WearOsLocalDataSourceImpl.boxName),
    ]);
  }

  static void _registerAdapter<T>(TypeAdapter<T> adapter) {
    if (!Hive.isAdapterRegistered(adapter.typeId)) {
      Hive.registerAdapter<T>(adapter);
    }
  }

  static Future<void> _openBox<T>(String boxName) async {
    if (!Hive.isBoxOpen(boxName)) await Hive.openBox<T>(boxName);
  }
}
