import 'package:easy_birthday/features/wear_os/data/models/phone_login_reply.dart';

abstract class WearOsRepository {
  String? getSavedEventId();
  Future<void> saveEventId(String eventId);
  Future<void> clearEventId();

  /// Every answer of the phone to a login request, also late ones (the user
  /// may finish logging in on the phone long after asking).
  Stream<PhoneLoginReply> watchPhoneLoginReplies();

  /// Asks the phone app to log in; the answer arrives on
  /// [watchPhoneLoginReplies].
  Future<void> sendPhoneLoginRequest();
}
