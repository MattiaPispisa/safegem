import 'package:dartz/dartz.dart';
import 'package:en_logger/en_logger.dart';
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
    required EnLogger logger,
  })  : _speechToText = speechToText,
        _available = available,
        _logger = logger;

  /// factory method to pre resolve with dependency injection
  /// the service
  @FactoryMethod(preResolve: true)
  static Future<ImplSpeechRecognizerService> create(
    stt.SpeechToText speechToText,
    EnLogger logger,
  ) async {
    final available = await speechToText.initialize();
    final instance = logger.getConfiguredInstance(
      prefix: 'ImplSpeechRecognizerService',
    )..info('speech to text availability: $available');
    return ImplSpeechRecognizerService(
      speechToText: speechToText,
      available: available,
      logger: instance,
    );
  }

  final bool _available;
  final stt.SpeechToText _speechToText;
  final EnLogger _logger;

  @override
  bool available() {
    return _available;
  }

  @override
  Unit listen(void Function(SpeechRecognizerResult result) onResult) {
    _logger.info('start listen');
    _speechToText.listen(
      // ignore: deprecated_member_use
      listenMode: ListenMode.dictation,
      pauseFor: const Duration(seconds: 4),
      listenFor: const Duration(seconds: 60),
      onResult: (result) {
        _logger.info(
          'recognizedWords: ${result.recognizedWords}, '
          'finalResult: ${result.finalResult}',
        );
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
    _logger.info('stop listen');
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
