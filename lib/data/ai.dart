import 'dart:math' as math;

import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:injectable/injectable.dart';

/// Abstraction of an artificial intelligence service:
// ignore: one_member_abstracts
abstract interface class AI {
  /// Generates content responding to [prompt].
  Future<GenerateContentResponse> generateContent(Iterable<Content> prompt);
}

/// Base [AI] exception thrown when generating content fails.
sealed class AIException implements Exception {}

/// An [AIException] thrown when service is not supported in current location
final class AIUnsupportedLocationException implements AIException {}

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
  Future<GenerateContentResponse> generateContent(
    Iterable<Content> prompt,
  ) async {
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      return GenerateContentResponse(
        [
          Candidate(
            Content.text('police:112 ${_generateRandomString(10)}'),
            null,
            null,
            null,
            null,
          ),
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
    final random = math.Random();

    return List.generate(length, (index) => chars[random.nextInt(chars.length)])
        .join();
  }
}
