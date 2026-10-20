import 'package:easy_birthday/features/user/data/models/persona_model.dart';

/// Users (owner and partner) on this device and in Firestore.
///
/// The save methods update the local copy and `SessionService` first, then
/// the remote document, so the device keeps the change even if the remote
/// write fails (the error is rethrown).
abstract class UserRepository {
  /// The user saved on this device, or an empty persona when signed out.
  PersonaModel getLocalUser();
  PersonaModel? getLocalPartner();

  /// The remote user; throws `AppException(notFound)` when there is none.
  /// Doesn't touch the device or the session.
  Future<PersonaModel> getUser(String phoneNumber);
  Future<bool> userExists(String phoneNumber);

  /// Creates the owner account right after phone verification, from the
  /// session user ([password] is already encrypted).
  Future<void> registerOwner({
    required String phoneNumber,
    required String password,
  });

  /// Saves the signed-in user (also sets the session gender) and updates
  /// the remote document only if it exists.
  Future<void> saveUser(PersonaModel user);

  /// Saves the partner and creates their remote document if missing.
  Future<void> createPartner(PersonaModel partner);

  /// Saves the partner and updates their remote document only if it exists.
  Future<void> savePartner(PersonaModel partner);
}
