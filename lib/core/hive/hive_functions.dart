import 'dart:developer';
import 'dart:io';

import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/features/settings/data/models/app_settings_model.dart';
import 'package:easy_birthday/features/wear_os/data/datasources/wear_os_local_data_source.dart';
import 'package:easy_birthday/features/user/data/models/persona_model.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

/// Clears every piece of per-user data stored on the device. Used on logout
/// and account deletion so the next account never sees the previous user's
/// partner, categories or cached values.
Future<void> clearAllHiveBoxes() async {
  // Each box must be accessed with the type it was opened with: Hive throws
  // on an untyped lookup of a typed box (that bug broke logout).
  await Future.wait([
    _clearBox<AppSettingsModel>(AppSettingsModel.hiveKey),
    _clearBox<PersonaModel>(PersonaModel.hiveKey),
    _clearBox<PersonaModel>(PersonaModel.partnerHiveKey),
    // Legacy box from older versions (no longer used).
    _clearBox<dynamic>('CategoryModel'),
    _clearBox<String>(WearOsLocalDataSourceImpl.boxName),
  ]);
  SessionService().reset();
}

/// Clears one box; never throws, so a single bad box can't block logout.
Future<void> _clearBox<T>(String key) async {
  try {
    if (Hive.isBoxOpen(key)) {
      await Hive.box<T>(key).clear();
    } else if (await Hive.boxExists(key)) {
      await Hive.deleteBoxFromDisk(key);
    }
  } catch (e) {
    log('Could not clear Hive box $key: $e');
  }
}

/// Developer tool: deletes the temp/cache and app-support directories.
Future<void> removeAllStorageAndCache() async {
  final List<Directory> dirs = await Future.wait([
    getTemporaryDirectory(),
    getApplicationSupportDirectory(),
  ]);
  for (final Directory dir in dirs) {
    if (await dir.exists()) await dir.delete(recursive: true);
  }
  SessionService().reset();
}
