import 'dart:math';

import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:injectable/injectable.dart';

abstract class AI {
  Future<GenerateContentResponse> generateContent(Iterable<Content> prompt);
}

sealed class AIException implements Exception {}

final class AIUnsupportedLocationException implements AIException {}

@Singleton(as: AI, env: ['production'])
class GoogleAI implements AI {
  const GoogleAI({required GenerativeModel model}) : _model = model;

  final GenerativeModel _model;

  @override
  Future<GenerateContentResponse> generateContent(Iterable<Content> prompt) {
    try {
      return _model.generateContent(prompt);
    } on GenerativeAIException {
      throw AIUnsupportedLocationException();
    } catch (e) {
      rethrow;
    }
  }
}

@Singleton(as: AI, env: ['develop'])
class MockAI implements AI {
  const MockAI();

  @override
  Future<GenerateContentResponse> generateContent(
      Iterable<Content> prompt,) async {
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      return GenerateContentResponse(
        [
          Candidate(Content.text('police:112 ${_generateRandomString(10)}'),
              null, null, null, null,),
        ],
        null,
      );
    } catch (e) {
      throw AIUnsupportedLocationException();
    }
  }

  String _generateRandomString(int length) {
    const chars =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random();

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

    final safetySettings = <SafetySetting>[];

    return GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: apiKey,
      safetySettings: safetySettings,
      generationConfig: generationConfig,
    );
  }
}
