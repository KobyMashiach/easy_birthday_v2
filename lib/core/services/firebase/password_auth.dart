import 'dart:developer';

import 'package:easy_birthday/core/services/encryption_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// Real Firebase users for phone + password login.
///
/// NOT WIRED IN YET: login currently uses the saved (encrypted) password, as in
/// earlier versions. To switch over, enable Email/Password in the Firebase
/// console, then use [signInWithPhonePassword] for password login and
/// [setPasswordForCurrentUser] after registration / SMS login / password
/// change. [legacyPassword] and [minPasswordLength] are used today.
///
/// Every account signs up with its phone number (SMS code). To also allow
/// logging in with a password, an email/password credential is linked to that
/// same Firebase user, using an internal address derived from the phone
/// number (the user never sees it). Firebase stores the password securely, so
/// the app no longer keeps passwords in Firestore.
///
/// Accounts created before this change keep a legacy encrypted password in
/// their Firestore document. They are migrated the first time they verify
/// their phone with an SMS code: the credential is linked and the legacy
/// password is deleted.

/// Minimum password length (Firebase's own minimum is 6).
const int minPasswordLength = 8;

const String _authEmailDomain = 'easybirthday.app';

/// Internal login email for a phone number, e.g. +972501234567 ->
/// 972501234567@easybirthday.app.
String authEmailForPhone(String phoneNumber) =>
    '${phoneNumber.replaceAll(RegExp(r'[^0-9]'), '')}@$_authEmailDomain';

enum PasswordSignInResult {
  /// Signed in to Firebase as the real user.
  success,

  /// No password credential for this phone, or the password is wrong.
  invalidCredentials,

  /// Email/Password sign-in is disabled in the Firebase project. Callers
  /// fall back to the legacy password check so login keeps working.
  providerDisabled,

  /// Firebase temporarily blocked attempts for this account.
  tooManyRequests,

  /// Network or unexpected error.
  error,
}

Future<PasswordSignInResult> signInWithPhonePassword(
  String phoneNumber,
  String password,
) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: authEmailForPhone(phoneNumber),
      password: password,
    );
    return PasswordSignInResult.success;
  } on FirebaseAuthException catch (e) {
    log('Password sign-in failed: ${e.code}');
    switch (e.code) {
      case 'invalid-credential':
      case 'wrong-password':
      case 'user-not-found':
      case 'invalid-email':
      case 'INVALID_LOGIN_CREDENTIALS':
        return PasswordSignInResult.invalidCredentials;
      case 'too-many-requests':
        return PasswordSignInResult.tooManyRequests;
      case 'network-request-failed':
        return PasswordSignInResult.error;
      default:
        // 'operation-not-allowed', or an internal error carrying
        // PASSWORD_LOGIN_DISABLED (depends on the SDK version): the
        // Email/Password provider is off. Anything else unexpected also falls
        // back to the legacy path rather than blocking login.
        return PasswordSignInResult.providerDisabled;
    }
  } catch (e) {
    log('Password sign-in failed: $e');
    return PasswordSignInResult.error;
  }
}

/// Sets [password] as the login password of the currently signed-in user
/// (who must have just verified their phone). Links the email/password
/// credential the first time, updates it afterwards. Returns true on success.
Future<bool> setPasswordForCurrentUser(
  String phoneNumber,
  String password,
) async {
  final User? user = FirebaseAuth.instance.currentUser;
  if (user == null || password.length < 6) return false;
  try {
    final bool hasPassword = user.providerData.any(
      (p) => p.providerId == 'password',
    );
    if (hasPassword) {
      await user.updatePassword(password);
    } else {
      await user.linkWithCredential(
        EmailAuthProvider.credential(
          email: authEmailForPhone(phoneNumber),
          password: password,
        ),
      );
    }
    return true;
  } on FirebaseAuthException catch (e) {
    log('Linking password failed: ${e.code}');
    return false;
  }
}

/// Plain password from a legacy (pre-Firebase-password) persona, or null.
String? legacyPassword(String storedPassword) {
  if (storedPassword.isEmpty) return null;
  try {
    return MyEncryptionDecryption.getStringFromEncrypted(storedPassword);
  } catch (_) {
    return null;
  }
}
