import 'dart:async';

import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/features/user/data/models/role_model.dart';
import 'package:flutter/foundation.dart';

/// Phone side of the Wear OS login: for as long as the app runs, a
/// `/start_login` message from the watch opens the login page, and the result
/// of that login is sent back as `/login_response`. A phone already signed in
/// as an owner with an event answers right away and stays where it is.
class WatchLoginListener {
  final Stream<Map<String, dynamic>> messages;
  final Future<void> Function(Map<String, dynamic> message) sendMessage;

  /// Opens the login page with the callback that reports the result.
  final void Function(void Function(bool loginSuccess, bool isOwner) onResult)
  openLogin;

  /// The signed-in event, read when the login finishes.
  final String? Function() currentEventId;

  /// The event of the owner already signed in on this phone, or null.
  final String? Function() signedInOwnerEventId;

  StreamSubscription<Map<String, dynamic>>? _subscription;

  WatchLoginListener({
    required this.messages,
    required this.sendMessage,
    required this.openLogin,
    required this.currentEventId,
    this.signedInOwnerEventId = _sessionOwnerEventId,
  });

  static String? _sessionOwnerEventId() {
    final session = SessionService();
    final user = session.user;
    final bool signedInOwner =
        user.phoneNumber.isNotEmpty &&
        user.role.isNotPartner() &&
        user.registerComplete;
    return signedInOwner ? session.event?.eventId : null;
  }

  void start() {
    _subscription ??= messages.listen(
      (message) {
        if (message['path'] != '/start_login') return;
        if (signedInOwnerEventId() case final String eventId) {
          debugPrint('Watch login request received, already signed in');
          _send(
            loginResponse(loginSuccess: true, isOwner: true, eventId: eventId),
          );
          return;
        }
        debugPrint('Watch login request received, opening login');
        openLogin(_reply);
      },
      onError: (Object e) => debugPrint('Watch message error: $e'),
    );
  }

  Future<void> stop() async {
    await _subscription?.cancel();
    _subscription = null;
  }

  void _reply(bool loginSuccess, bool isOwner) => _send(
    loginResponse(
      loginSuccess: loginSuccess,
      isOwner: isOwner,
      eventId: currentEventId(),
    ),
  );

  void _send(Map<String, dynamic> response) => sendMessage(
    response,
  ).catchError((Object e) => debugPrint('Watch login response failed: $e'));

  /// `success` needs the event id (the watch opens that event), so an owner
  /// without an event is reported as `failed`.
  static Map<String, dynamic> loginResponse({
    required bool loginSuccess,
    required bool isOwner,
    required String? eventId,
  }) => switch ((loginSuccess, isOwner)) {
    (true, true) when eventId != null => {
      'path': '/login_response',
      'status': 'success',
      'eventId': eventId,
    },
    (true, false) => {'path': '/login_response', 'status': 'partner'},
    _ => {'path': '/login_response', 'status': 'failed'},
  };
}
