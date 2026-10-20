import 'package:easy_birthday/core/errors/app_exception.dart';
import 'package:easy_birthday/core/hive/hive_functions.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/services/firebase/password_auth.dart';
import 'package:easy_birthday/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:easy_birthday/features/auth/domain/repositories/auth_repository.dart';
import 'package:easy_birthday/features/event/data/datasources/event_remote_data_source.dart';
import 'package:easy_birthday/features/user/data/datasources/user_remote_data_source.dart';
import 'package:easy_birthday/features/user/data/models/persona_model.dart';
import 'package:easy_birthday/features/user/data/models/role_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authDataSource;
  final UserRemoteDataSource userDataSource;
  final EventRemoteDataSource eventDataSource;

  AuthRepositoryImpl({
    required this.authDataSource,
    required this.userDataSource,
    required this.eventDataSource,
  });

  @override
  Future<String?> sendOtp(String phoneNumber) =>
      authDataSource.sendOtp(phoneNumber);

  @override
  Future<void> verifyOtp({
    required String verificationId,
    required String smsCode,
  }) => authDataSource.verifyOtp(
    verificationId: verificationId,
    smsCode: smsCode,
  );

  @override
  Future<PersonaModel> loginWithPassword({
    required String phoneNumber,
    required String password,
  }) async {
    final data = await userDataSource.getUser(phoneNumber);
    if (data == null || data.isEmpty) {
      throw const AppException(AppErrorType.notFound);
    }
    final persona = PersonaModel.fromJson(data);
    if (legacyPassword(persona.password) != password) {
      throw const AppException(AppErrorType.wrongPassword);
    }
    return persona;
  }

  @override
  Future<void> logout() async {
    try {
      await authDataSource.signOut();
    } finally {
      await clearAllHiveBoxes();
    }
  }

  @override
  Future<void> deleteAccount() async {
    final session = SessionService();
    final user = session.user;
    final partner = session.partner;
    final eventId = session.event?.eventId ?? user.eventId;

    // Every delete is idempotent, so they run in parallel; the user's own
    // document goes last so a failed attempt can be retried.
    if (user.role.isNotPartner()) {
      await Future.wait([
        if (eventId != null && eventId.isNotEmpty) ...[
          eventDataSource.deleteMediaFolder(eventId),
          eventDataSource.deleteEvent(eventId),
        ],
        if (partner != null && partner.phoneNumber.isNotEmpty)
          userDataSource.deleteUser(partner.phoneNumber),
      ]);
    }
    if (user.phoneNumber.isNotEmpty) {
      await userDataSource.deleteUser(user.phoneNumber);
    }
    await authDataSource.deleteCurrentUser();
    await clearAllHiveBoxes();
  }
}
