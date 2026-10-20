/// How the phone answered a login request from the watch.
enum PhoneLoginStatus { success, partner, failed }

/// The phone's `/login_response` message.
class PhoneLoginReply {
  final PhoneLoginStatus status;

  /// The event to open on the watch; set only when [status] is success.
  final String? eventId;

  const PhoneLoginReply({required this.status, this.eventId});

  /// A `success` without an event id can't open anything on the watch, so it
  /// counts as failed (the phone never sends one).
  factory PhoneLoginReply.fromMessage(Map<String, dynamic> message) {
    final String? eventId = message['eventId'] as String?;
    return switch (message['status']) {
      'success' when eventId != null => PhoneLoginReply(
        status: .success,
        eventId: eventId,
      ),
      'partner' => const PhoneLoginReply(status: .partner),
      _ => const PhoneLoginReply(status: .failed),
    };
  }
}
