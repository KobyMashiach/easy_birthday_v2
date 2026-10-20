import 'package:firebase_ai/firebase_ai.dart';

abstract class GreetingRemoteDataSource {
  Future<String> generateGreeting(String prompt);
}

class GreetingRemoteDataSourceImpl implements GreetingRemoteDataSource {
  /// Gemini model used for greeting generation. Gemini 1.5 was retired by
  /// Google, so keep this pointed at a currently supported model.
  static const String _geminiModel = 'gemini-3.7-flash';

  @override
  Future<String> generateGreeting(String prompt) async {
    // Firebase AI Logic: no API key is shipped inside the app binary.
    final model = FirebaseAI.googleAI().generativeModel(model: _geminiModel);
    final response = await model.generateContent([Content.text(prompt)]);
    final String? text = response.text;
    // Surface an empty answer as a failure instead of showing it as a greeting.
    if (text == null || text.trim().isEmpty) {
      throw StateError('Empty greeting response');
    }
    return text;
  }
}
