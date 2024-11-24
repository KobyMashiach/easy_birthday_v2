import 'package:flutter/material.dart';
import 'package:watch_connectivity/watch_connectivity.dart';

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
    return Scaffold(
      appBar: AppBar(title: const Text("Login with Phone")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              loginStatus,
              style: const TextStyle(fontSize: 18),
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
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
