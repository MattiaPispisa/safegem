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
    return GenerateContentResponse(
      [
        Candidate(Content.text("text"), null, null, null, null),
      ],
      null,
    );
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
