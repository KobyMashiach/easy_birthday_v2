import 'package:easy_birthday/core/di/injector.dart';
import 'package:watch_connectivity/watch_connectivity.dart';

/// Messages between the watch and the phone app.
abstract class WearOsPhoneDataSource {
  /// The phone's answers to login requests (`/login_response` messages).
  Stream<Map<String, dynamic>> get loginResponses;

  /// Asks the phone to log in (`/start_login`).
  Future<void> sendLoginRequest();
}

class WearOsPhoneDataSourceImpl implements WearOsPhoneDataSource {
  WearOsPhoneDataSourceImpl({WatchConnectivity? watchConnectivity})
    : _watchConnectivity = watchConnectivity;

  WatchConnectivity? _watchConnectivity;

  // Resolved on first use: only the watch app talks to the phone.
  WatchConnectivity get _watch =>
      _watchConnectivity ??= Injector().watchConnectivity;

  @override
  Stream<Map<String, dynamic>> get loginResponses => _watch.messageStream.where(
    (message) => message['path'] == '/login_response',
  );

  @override
  Future<void> sendLoginRequest() =>
      _watch.sendMessage({'path': '/start_login', 'action': 'login'});
}
