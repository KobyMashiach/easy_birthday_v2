import 'dart:developer';

import 'package:easy_birthday/widgets/design/buttons/app_button.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiTry extends StatefulWidget {
  const GeminiTry({super.key});

  @override
  State<GeminiTry> createState() => _GeminiTryState();
}

const apiKey = "AIzaSyBCxntcoC40zJUy7nacgXntaMEkqiFL3hU";

class _GeminiTryState extends State<GeminiTry> {
  String geminiText = 'empty';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: "Gemini try"),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(geminiText),
            appButton(text: "Generete text", onTap: getText)
          ],
        ),
      ),
    );
  }

  void getText() async {
    final model = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: apiKey,
    );

    final prompt =
        "תרשום ברכת יום הולדת של 10 שורות לאשתי, קוראים לה הודיה והיא תהיה בת 25";
    final content = [Content.text(prompt)];
    final response = await model.generateContent(content);

    log(response.text ?? "");
    setState(() {
      geminiText = response.text ?? 'Empty';
    });
  }
}
