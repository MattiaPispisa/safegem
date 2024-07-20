import 'package:injectable/injectable.dart';
import 'package:safegem/domain/domain.dart';

/// Abstraction of an artificial intelligence service:
// ignore: one_member_abstracts
abstract interface class AI {
  /// Generates content responding to [prompt].
  Future<AIResponse> generateContent(String prompt);
}

/// Base [AI] exception thrown when generating content fails.
sealed class AIException implements Exception {}

/// An [AIException] thrown when service is not supported in current location
final class AIUnsupportedLocationException implements AIException {}

/// AI response
class AIResponse {
  /// constructor
  const AIResponse({required this.text});

  /// The text of the best candidate response for the AI.
  final String? text;
}

/// A mocked implementation of [AI]
///
/// `google_generative_ai` is not freely available (as it is in the USA),
/// so most tests within the app have been performed using a
/// mocked implementation of the AI service
@Singleton(as: AI, env: ['develop'])
class MockAI implements AI {
  /// constructor
  const MockAI();

  @override
  Future<AIResponse> generateContent(
    String prompt,
  ) async {
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      return AIResponse(
        text: 'police:112 ${StringHelper.generateRandomString(10)}',
      );
    } catch (e) {
      throw AIUnsupportedLocationException();
    }
  }
}
