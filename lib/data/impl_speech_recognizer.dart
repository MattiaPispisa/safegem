import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:speech_to_text/speech_to_text.dart';

import '../domain/domain.dart';

@LazySingleton(as: SpeechRecognizerService)
class ImplSpeechRecognizerService implements SpeechRecognizerService {
  ImplSpeechRecognizerService({
    required stt.SpeechToText speechToText,
    required bool available,
  })  : _speechToText = speechToText,
        _available = available;

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

@module
abstract class SpeechToTextModule {
  stt.SpeechToText getRecognizer() {
    return stt.SpeechToText();
  }
}
