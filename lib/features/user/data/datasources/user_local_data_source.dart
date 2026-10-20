import 'package:easy_birthday/features/user/data/models/persona_model.dart';
import 'package:hive_ce/hive.dart';

abstract class UserLocalDataSource {
  PersonaModel? getUser();
  Future<void> saveUser(PersonaModel user);
  PersonaModel? getPartner();
  Future<void> savePartner(PersonaModel partner);
}

/// Single-entry Hive boxes: the signed-in user and their partner.
class UserLocalDataSourceImpl implements UserLocalDataSource {
  static const _key = 'current';

  Box<PersonaModel> get _userBox =>
      Hive.box<PersonaModel>(PersonaModel.hiveKey);
  Box<PersonaModel> get _partnerBox =>
      Hive.box<PersonaModel>(PersonaModel.partnerHiveKey);

  // Older versions stored the persona with box.add (auto-increment key), so
  // read the first value rather than a fixed key.
  @override
  PersonaModel? getUser() => _userBox.isEmpty ? null : _userBox.values.first;

  @override
  Future<void> saveUser(PersonaModel user) async {
    await _userBox.clear();
    await _userBox.put(_key, user);
  }

  @override
  PersonaModel? getPartner() =>
      _partnerBox.isEmpty ? null : _partnerBox.values.first;

  @override
  Future<void> savePartner(PersonaModel partner) async {
    await _partnerBox.clear();
    await _partnerBox.put(_key, partner);
  }
}
