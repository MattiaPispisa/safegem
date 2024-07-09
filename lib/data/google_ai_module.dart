import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:injectable/injectable.dart';
import 'package:safegem/data/ai.dart';

/// An [AI] implementation using google model
///
/// Can also be used on [google studio](https://aistudio.google.com/app/prompts)
@Singleton(as: AI, env: ['production'])
class GoogleAI implements AI {
  /// constructor
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

/// google model module for dependency injection
@module
abstract class GoogleGenerativeModule {
  /// google model module for dependency injection
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
