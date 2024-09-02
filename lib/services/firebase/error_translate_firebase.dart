import 'package:easy_birthday/i18n/strings.g.dart';

getMessageFromErrorCode(String err) {
  switch (err) {
    case "ERROR_EMAIL_ALREADY_IN_USE":
    case "account-exists-with-different-credential":
    case "email-already-in-use":
      return t.email_exist;
    case "ERROR_WRONG_PASSWORD":
    case "wrong-password":
      return t.wrong_password;
    case "invalid-credential":
      return t.invalid_credential;
    case "weak-password":
      return t.short_password;
    case "ERROR_USER_NOT_FOUND":
    case "user-not-found":
      return t.user_not_found;
    case "ERROR_USER_DISABLED":
    case "user-disabled":
      return t.user_disabled;
    case "ERROR_TOO_MANY_REQUESTS":
    case "operation-not-allowed":
      return t.too_many_requests;
    case "ERROR_OPERATION_NOT_ALLOWED":
      return t.operation_not_allowed;
    case "ERROR_INVALID_EMAIL":
    case "invalid-email":
      return t.email_not_valid;
    default:
      return t.default_error;
  }
}
