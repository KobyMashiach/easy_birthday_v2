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

  String loginStatus = "Waiting for phone login...";

  @override
  void initState() {
    super.initState();
    _initializeWatchConnectivity();
  }

  Future<void> _initializeWatchConnectivity() async {
    _watchConnectivity.messageStream.listen((message) {
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
      await _watchConnectivity.sendMessage({
        'path': '/start_login',
        'action': 'login',
      });
      setState(() {
        loginStatus = "Waiting for phone login...";
      });
    } catch (e) {
      setState(() {
        loginStatus = "Failed to send login request. Please try again.";
      });
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
              child: Center(
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
        ),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
