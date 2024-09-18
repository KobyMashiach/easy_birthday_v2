import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:easy_birthday/services/firebase/error_translate_firebase.dart';

Future<bool> isUserLoggedIn() async {
  User? user = FirebaseAuth.instance.currentUser;
  return user != null;
}

Future<String> verifyPhoneNumber(
    String phoneNumber,
    Function(PhoneAuthCredential) verificationCompleted,
    Function(FirebaseAuthException) verificationFailed,
    Function(String, int?) codeSent,
    Function(String) codeAutoRetrievalTimeout) async {
  try {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
    return "";
  } on FirebaseAuthException catch (e) {
    return getMessageFromErrorCode(e.code);
  } catch (e) {
    log(e.toString());
    return "";
  }
}

Future<String> signInWithPhoneAuthCredential(
    PhoneAuthCredential phoneAuthCredential) async {
  try {
    await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
    return "";
  } on FirebaseAuthException catch (e) {
    return getMessageFromErrorCode(e.code);
  } catch (e) {
    log(e.toString());
    return "";
  }
}

Future<String> signInWithOTP(String verificationId, String smsCode) async {
  try {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    return "";
  } on FirebaseAuthException catch (e) {
    return getMessageFromErrorCode(e.code);
  } catch (e) {
    log(e.toString());
    return "";
  }
}

Future<String> registerEmailPassword(String email, String password) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return "";
  } on FirebaseAuthException catch (e) {
    return getMessageFromErrorCode(e.code);
  } catch (e) {
    log(e.toString());
    return "";
  }
}

Future<String> loginEmailPassword(String email, String password) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return "";
  } on FirebaseAuthException catch (e) {
    return getMessageFromErrorCode(e.code);
  } catch (e) {
    log(e.toString());
    return "";
  }
}

Future<String> forgetPassword(String email) async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    return "";
  } on FirebaseAuthException catch (e) {
    return getMessageFromErrorCode(e.code);
  } catch (e) {
    log(e.toString());
    return "";
  }
}

Future<String> verifyEmail() async {
  try {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
      return "";
    } else if (user != null && user.emailVerified) {
      return "Email already verified";
    }
    return "No user signed in";
  } on FirebaseAuthException catch (e) {
    return getMessageFromErrorCode(e.code);
  } catch (e) {
    log(e.toString());
    return "";
  }
}

Future<String> logoutFirestore() async {
  try {
    await FirebaseAuth.instance.signOut();
    return "";
  } catch (e) {
    log(e.toString());
    return "An error occurred while logging out";
  }
}
