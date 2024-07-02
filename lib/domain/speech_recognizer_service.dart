import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class SpeechRecognizerService {
  Unit listen(void Function(SpeechRecognizerResult result) onResult);
  Unit stop();
  bool available();
}

class SpeechRecognizerResult extends Equatable {
  const SpeechRecognizerResult({
    required this.recognizedWords,
    required this.finalResult,
  });

  final String recognizedWords;
  final bool finalResult;

  @override
  List<Object?> get props => [
        recognizedWords,
        finalResult,
      ];
}
