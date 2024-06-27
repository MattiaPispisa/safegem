import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:injectable/injectable.dart';

@module
abstract class GoogleGenerativeModule {
  @singleton
  GenerativeModel get model {
    const apiKey = String.fromEnvironment('GENERATIVE_MODEL_API_KEY');

    final generationConfig = GenerationConfig();

    final safetySettings = [
      SafetySetting(HarmCategory.harassment, HarmBlockThreshold.high)
    ];

    return GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: apiKey,
      safetySettings: safetySettings,
      generationConfig: generationConfig,
    );
  }
}
