import 'package:easy_birthday/core/errors/app_exception.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/gender_utils.dart';
import 'package:easy_birthday/core/utils/i18n/slang_settings.dart';
import 'package:easy_birthday/features/user/data/datasources/user_local_data_source.dart';
import 'package:easy_birthday/features/user/data/datasources/user_remote_data_source.dart';
import 'package:easy_birthday/features/user/data/models/persona_model.dart';
import 'package:easy_birthday/features/user/data/models/role_model.dart';
import 'package:easy_birthday/features/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource localDataSource;
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  SessionService get _session => SessionService();

  @override
  PersonaModel getLocalUser() =>
      localDataSource.getUser() ?? SessionService.emptyUser;

  @override
  PersonaModel? getLocalPartner() => localDataSource.getPartner();

  @override
  Future<PersonaModel> getUser(String phoneNumber) async {
    final data = await remoteDataSource.getUser(phoneNumber);
    if (data == null || data.isEmpty) {
      throw const AppException(
        AppErrorType.notFound,
        message: 'No user document for this phone number',
      );
    }
    return PersonaModel.fromJson(data);
  }

  @override
  Future<bool> userExists(String phoneNumber) =>
      remoteDataSource.userExists(phoneNumber);

  @override
  Future<void> registerOwner({
    required String phoneNumber,
    required String password,
  }) async {
    final user = _session.user.copyWith(
      phoneNumber: phoneNumber,
      password: password,
      role: RoleModel.owner,
    );
    await localDataSource.saveUser(user);
    _session.user = user;
    await remoteDataSource.createUser(phoneNumber, user.toJson());
  }

  @override
  Future<void> saveUser(PersonaModel user) async {
    await localDataSource.saveUser(user);
    _session.user = user;
    changeGender(male: checkIfMaleGender(user.gender));
    if (await remoteDataSource.userExists(user.phoneNumber)) {
      await remoteDataSource.updateUser(user.phoneNumber, user.toJson());
    }
  }

  @override
  Future<void> createPartner(PersonaModel partner) async {
    await localDataSource.savePartner(partner);
    _session.partner = partner;
    if (!await remoteDataSource.userExists(partner.phoneNumber)) {
      await remoteDataSource.createUser(partner.phoneNumber, partner.toJson());
    }
  }

  @override
  Future<void> savePartner(PersonaModel partner) async {
    await localDataSource.savePartner(partner);
    _session.partner = partner;
    if (await remoteDataSource.userExists(partner.phoneNumber)) {
      await remoteDataSource.updateUser(partner.phoneNumber, partner.toJson());
    }
  }
}
