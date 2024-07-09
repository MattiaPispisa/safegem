import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:safegem/domain/domain.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:speech_to_text/speech_to_text.dart';

/// Implementation of [SpeechRecognizerService] using [stt.SpeechToText]
@LazySingleton(as: SpeechRecognizerService)
class ImplSpeechRecognizerService implements SpeechRecognizerService {
  /// constructor
  ImplSpeechRecognizerService({
    required stt.SpeechToText speechToText,
    required bool available,
  })  : _speechToText = speechToText,
        _available = available;

  /// factory method to pre resolve with dependency injection
  /// the service
  @FactoryMethod(preResolve: true)
  static Future<ImplSpeechRecognizerService> create(
    stt.SpeechToText speechToText,
  ) async {
    final available = await speechToText.initialize();
    return ImplSpeechRecognizerService(
      speechToText: speechToText,
      available: available,
    );
  }

  final bool _available;
  final stt.SpeechToText _speechToText;

  @override
  bool available() {
    return _available;
  }

  @override
  Unit listen(void Function(SpeechRecognizerResult result) onResult) {
    _speechToText.listen(
      // ignore: deprecated_member_use
      listenMode: ListenMode.dictation,
      pauseFor: const Duration(seconds: 4),
      listenFor: const Duration(seconds: 60),
      onResult: (result) {
        onResult(
          SpeechRecognizerResult(
            finalResult: result.finalResult,
            recognizedWords: result.recognizedWords,
          ),
        );
      },
    );
    return unit;
  }

  @override
  Unit stop() {
    _speechToText.stop();
    return unit;
  }
}

/// speech to text module
@module
abstract class SpeechToTextModule {
  /// speech to text module
  stt.SpeechToText getRecognizer() {
    return stt.SpeechToText();
  }
}
