import 'dart:math';

import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:injectable/injectable.dart';

abstract class AI {
  Future<GenerateContentResponse> generateContent(Iterable<Content> prompt);
}

@Singleton(as: AI, env: ["production"])
class GoogleAI implements AI {
  const GoogleAI({required GenerativeModel model}) : _model = model;

  final GenerativeModel _model;

  @override
  Future<GenerateContentResponse> generateContent(Iterable<Content> prompt) {
    return _model.generateContent(prompt);
  }
}

// TODO: read from assets
@Singleton(as: AI, env: ["develop"])
class MockAI implements AI {
  const MockAI();

  @override
  Future<GenerateContentResponse> generateContent(
      Iterable<Content> prompt) async {
    await Future<void>.delayed(Duration(seconds: 1));
    return GenerateContentResponse(
      [
        Candidate(Content.text("police:112 ${_generateRandomString(10)}"), null,
            null, null, null),
      ],
      null,
    );
  }

  String _generateRandomString(int length) {
    const String chars =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    final Random random = Random();

    return List.generate(length, (index) => chars[random.nextInt(chars.length)])
        .join();
  }
}

@module
abstract class GoogleGenerativeModule {
  @singleton
  GenerativeModel get model {
    const apiKey = String.fromEnvironment('GENERATIVE_MODEL_API_KEY');

    final generationConfig = GenerationConfig();

    List<SafetySetting> safetySettings = [];

    return GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: apiKey,
      safetySettings: safetySettings,
      generationConfig: generationConfig,
    );
  }
}
