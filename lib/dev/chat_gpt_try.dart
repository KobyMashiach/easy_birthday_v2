import 'dart:developer';

import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';

class ChatGptTry extends StatefulWidget {
  const ChatGptTry({super.key});

  @override
  _ChatGptTryState createState() => _ChatGptTryState();
}

class _ChatGptTryState extends State<ChatGptTry> {
  final OpenAI openAI = OpenAI.instance.build(
    token:
        "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",
    baseOption: HttpSetup(
      receiveTimeout: const Duration(seconds: 5),
      connectTimeout: const Duration(seconds: 5),
    ),
  );

  String _response = "";

  void _sendMessage() async {
    try {
      final request = CompleteText(
        prompt: "תעשה ברכה של 10 שורות",
        maxTokens: 200,
        model: Gpt3TurboInstruct(),
      );
      final response = await openAI.onCompletion(request: request);
      setState(() {
        _response = response?.choices.first.text.trim() ?? "No response";
      });
    } catch (e) {
      setState(() {
        _response = "Error: $e";
        log(e.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: "Try ChatGPT"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: _sendMessage,
              child: const Text("Send Blessing Request"),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  _response.isNotEmpty ? _response : "No response yet",
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
