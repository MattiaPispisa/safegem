import 'package:dartz/dartz.dart';

abstract class SpeechRecognizerService {
  Unit listen(void Function(SpeechRecognizerResult result) onResult);
  Unit stop();
  bool available();
}

class SpeechRecognizerResult {
  const SpeechRecognizerResult({
    required this.recognizedWords,
    required this.finalResult,
  });

  final String recognizedWords;
  final bool finalResult;
}
