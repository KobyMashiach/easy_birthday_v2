import 'dart:async';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/screens/wear_os/wear_design.dart';
import 'package:easy_birthday/screens/wear_os/wear_os_categories/wear_os_categories.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/main.dart';
import 'package:flutter/material.dart';
import 'package:kh_easy_dev/services/navigate_page.dart';
import 'package:watch_connectivity/watch_connectivity.dart';

class WearOSLoginPage extends StatefulWidget {
  const WearOSLoginPage({super.key});

  @override
  _WearOSLoginPageState createState() => _WearOSLoginPageState();
}

class _WearOSLoginPageState extends State<WearOSLoginPage> {
  final WatchConnectivity _watchConnectivity = WatchConnectivity();
  late StreamSubscription _messageSubscription;
  bool buttonDisable = false;
  bool loginSuccessful = false;

  String loginStatus = t.welcome;

  @override
  void initState() {
    super.initState();
    _initializeWatchConnectivity();
  }

  void _initializeWatchConnectivity() {
    _messageSubscription = _watchConnectivity.messageStream.listen((message) {
      if (message['path'] == '/login_response') {
        final status = message['status'] as String;
        final String? eventId = message['eventId'] as String?;
        updateLoginStatus(status, eventId);
      }
    });
  }

  void updateLoginStatus(String status, [String? eventId]) async {
    switch (status) {
      case 'success':
        setState(() {
          loginStatus = t.login_successful;
          loginSuccessful = true;
        });
        await Future.delayed(const Duration(seconds: 1));
        KheasydevNavigatePage().pushAndRemoveUntil(
          NavigationContextService.navigatorKey.currentContext!,
          WearOsCategories(eventId: eventId!),
        );
        break;
      case 'partner':
        setState(() {
          loginStatus = t.no_owner;
        });
        break;
      default:
        setState(() {
          loginStatus = t.login_failed;
        });
        break;
    }
  }

  Future<void> _sendLoginRequest() async {
    try {
      debugPrint("Sending login request to phone...");
      await _watchConnectivity.sendMessage({
        'path': '/start_login',
        'action': 'login',
      });

      setState(() {
        loginStatus = "${t.wait_for_phone_login}...";
      });

      bool isPhoneResponded =
          await _waitForPhoneResponse(timeout: const Duration(seconds: 30));

      if (!isPhoneResponded) {
        setState(() {
          loginStatus = t.please_open_app_in_phone;
        });
      } else {
        debugPrint("Login request handled by phone.");
      }
    } catch (e) {
      debugPrint("Error sending login request: $e");
      setState(() {
        loginStatus = t.failed_send_login_request;
      });
    }
  }

  Future<bool> _waitForPhoneResponse({required Duration timeout}) async {
    try {
      bool receivedResponse = false;
      final completer = Completer<bool>();

      _watchConnectivity.messageStream.listen((message) {
        if (message['action'] == 'login_response') {
          receivedResponse = true;
          completer.complete(true);
        }
      });

      await Future.any([
        completer.future,
        Future.delayed(timeout),
      ]);

      return receivedResponse;
    } catch (e) {
      debugPrint("Error waiting for phone response: $e");
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return WearDesign(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/logo_transparant.png',
              height: screenHeight * 0.4),
          Text(
            loginStatus,
            style: AppTextStyle().watchTitle,
            textAlign: TextAlign.center,
          ),
          loginSuccessful
              ? const CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: _sendLoginRequest,
                  child: Text(t.login_via_phone),
                ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _messageSubscription.cancel();
    super.dispose();
  }
}
