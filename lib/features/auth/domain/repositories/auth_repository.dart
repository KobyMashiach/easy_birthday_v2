import 'package:easy_birthday/features/user/data/models/persona_model.dart';

abstract class AuthRepository {
  /// The verification id of the SMS code, or `null` when the number was
  /// verified instantly (Android) and the user is already signed in.
  /// Failures are `AppException`s with a translated message (or none).
  Future<String?> sendOtp(String phoneNumber);

  /// Signs in with the SMS code; failures as in [sendOtp].
  Future<void> verifyOtp({
    required String verificationId,
    required String smsCode,
  });

  /// Checks [password] against the account of [phoneNumber] and returns it
  /// (doesn't sign in or save anything). Throws `AppException` notFound /
  /// wrongPassword.
  Future<PersonaModel> loginWithPassword({
    required String phoneNumber,
    required String password,
  });

  /// Signs out, removes every piece of per-user data from the device and
  /// resets the session, even when signing out fails (then rethrows).
  Future<void> logout();

  /// Permanently deletes the account and its data (store requirement), then
  /// clears the device and the session like [logout]. An owner also deletes
  /// the shared event, its media and the partner's account.
  Future<void> deleteAccount();
}
