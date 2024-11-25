import 'dart:async';
import 'package:flutter/material.dart';
import 'package:watch_connectivity/watch_connectivity.dart';
import 'package:wear/wear.dart';

class WearOSLoginPage extends StatefulWidget {
  const WearOSLoginPage({super.key});

  @override
  _WearOSLoginPageState createState() => _WearOSLoginPageState();
}

class _WearOSLoginPageState extends State<WearOSLoginPage> {
  final WatchConnectivity _watchConnectivity = WatchConnectivity();
  late StreamSubscription _messageSubscription;

  String loginStatus = "Waiting for phone login...";

  @override
  void initState() {
    super.initState();
    _initializeWatchConnectivity();
  }

  void _initializeWatchConnectivity() {
    _messageSubscription = _watchConnectivity.messageStream.listen((message) {
      if (message['path'] == '/login_response') {
        final status = message['status'] as String;
        setState(() {
          loginStatus =
              status == 'success' ? 'Login Successful' : 'Login Failed';
        });
      }
    });
  }

  Future<void> _sendLoginRequest() async {
    try {
      debugPrint("Sending login request to phone...");
      await _watchConnectivity.sendMessage({
        'path': '/start_login',
        'action': 'login',
      });

      // Set an initial status indicating a waiting state
      setState(() {
        loginStatus = "Waiting for phone login...";
      });

      // Wait for a response or timeout
      bool isPhoneResponded =
          await _waitForPhoneResponse(timeout: const Duration(seconds: 15));

      if (!isPhoneResponded) {
        // Display message if no response is received within the timeout
        setState(() {
          loginStatus =
              "Failed: Please open the app on your phone to continue.";
        });
      } else {
        debugPrint("Login request handled by phone.");
      }
    } catch (e) {
      debugPrint("Error sending login request: $e");
      setState(() {
        loginStatus = "Failed to send login request. Please try again.";
      });
    }
  }

  Future<bool> _waitForPhoneResponse({required Duration timeout}) async {
    try {
      // Simulating a listener for a response from the phone
      bool receivedResponse = false;
      final completer = Completer<bool>();

      // Add a listener to detect a response from the phone
      _watchConnectivity.messageStream.listen((message) {
        if (message['action'] == 'login_response') {
          receivedResponse = true;
          completer.complete(true);
        }
      });

      // Wait for either the response or timeout
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
    return WatchShape(builder: (context, shape, child) {
      final isRound = shape == WearShape.round;
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Container(
              decoration: isRound
                  ? const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    )
                  : BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    loginStatus,
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _sendLoginRequest,
                    child: const Text("Login via Phone"),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    _messageSubscription.cancel();
    super.dispose();
  }
}
