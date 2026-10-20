import 'package:hive_ce/hive.dart';

abstract class WearOsLocalDataSource {
  String? getSavedEventId();
  Future<void> saveEventId(String eventId);
  Future<void> clearEventId();
}

/// The event shown on the watch, saved after the phone approves the login.
class WearOsLocalDataSourceImpl implements WearOsLocalDataSource {
  static const boxName = 'general';
  static const _key = 'eventId';

  Box<String> get _box => Hive.box<String>(boxName);

  // Older versions stored the id with box.add (auto-increment key).
  @override
  String? getSavedEventId() => _box.isEmpty ? null : _box.values.first;

  @override
  Future<void> saveEventId(String eventId) async {
    await _box.clear();
    await _box.put(_key, eventId);
  }

  @override
  Future<void> clearEventId() => _box.clear();
}
