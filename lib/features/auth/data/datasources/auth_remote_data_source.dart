import 'dart:async';

import 'package:easy_birthday/core/errors/app_exception.dart';
import 'package:easy_birthday/core/services/firebase/error_translate_firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRemoteDataSource {
  /// Sends an SMS code to [phoneNumber]; completes with the verification id,
  /// or with `null` when Android verified the number instantly and the user
  /// is already signed in (no code to enter).
  Future<String?> sendOtp(String phoneNumber);
  Future<void> verifyOtp({
    required String verificationId,
    required String smsCode,
  });
  Future<void> signOut();

  /// Deletes the Firebase Auth user, or just signs out when Firebase requires
  /// a recent login for deletion.
  Future<void> deleteCurrentUser();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  static const _otpTimeout = Duration(seconds: 60);

  FirebaseAuth get _auth => FirebaseAuth.instance;

  @override
  Future<String?> sendOtp(String phoneNumber) {
    final completer = Completer<String?>();
    // Set once Android verified the number by itself; a later codeSent must
    // not send the user to the code page for an already signed-in account.
    bool autoVerifying = false;
    void fail(Object error) {
      if (completer.isCompleted) return;
      completer.completeError(_translate(error));
    }

    _auth
        .verifyPhoneNumber(
          phoneNumber: phoneNumber,
          timeout: _otpTimeout,
          // Android instant verification / auto-retrieval: sign in right away
          // when it happens before the code page was opened. After codeSent
          // the user types (or autofills) the code as usual.
          verificationCompleted: (credential) async {
            if (completer.isCompleted || autoVerifying) return;
            autoVerifying = true;
            try {
              await _auth.signInWithCredential(credential);
              if (!completer.isCompleted) completer.complete(null);
            } catch (e) {
              fail(e);
            }
          },
          verificationFailed: fail,
          codeSent: (verificationId, _) {
            if (!completer.isCompleted && !autoVerifying) {
              completer.complete(verificationId);
            }
          },
          codeAutoRetrievalTimeout: (_) {},
        )
        .catchError(fail);
    // Completing (not just timing out the future) makes the callbacks above
    // ignore a late answer, so nobody gets signed in behind the error.
    final timeout = Timer(
      _otpTimeout,
      () => fail(const AppException(AppErrorType.networkError)),
    );
    return completer.future.whenComplete(timeout.cancel);
  }

  @override
  Future<void> verifyOtp({
    required String verificationId,
    required String smsCode,
  }) async {
    try {
      await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
          verificationId: verificationId,
          smsCode: smsCode,
        ),
      );
    } on FirebaseAuthException catch (e) {
      throw _translate(e);
    }
  }

  /// Firebase errors become an [AppException] with a translated message.
  static Object _translate(Object error) => error is FirebaseAuthException
      ? AppException(
          AppErrorType.unauthorized,
          message: getMessageFromErrorCode(error.code),
        )
      : error;

  @override
  Future<void> signOut() => _auth.signOut();

  @override
  Future<void> deleteCurrentUser() async {
    try {
      await _auth.currentUser?.delete();
    } on FirebaseAuthException {
      // Data is already gone; a stale sign-in only blocks removing the auth
      // record, so sign out instead of failing the whole flow.
    }
    await _auth.signOut();
  }
}
