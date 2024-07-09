import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

/// Service that contains all the methods
/// for listening to a voice and converting it into text.
abstract interface class SpeechRecognizerService {
  /// start listening. [onResult] is called on every chunk recognized.
  /// On end a [onResult] is called
  /// with [SpeechRecognizerResult.finalResult] = `true`
  Unit listen(void Function(SpeechRecognizerResult result) onResult);

  /// stop listening
  Unit stop();

  /// if service is available
  bool available();
}

/// speech recognizer result.
///
/// [SpeechRecognizerResult] can contain a chunk of the speech
/// or the complete recognition. Use [finalResult] to check
/// if is the final result.
class SpeechRecognizerResult extends Equatable {
  /// constructor
  const SpeechRecognizerResult({
    required this.recognizedWords,
    required this.finalResult,
  });

  /// current recognizer words
  final String recognizedWords;

  /// if [recognizedWords] is the final result
  final bool finalResult;

  @override
  List<Object?> get props => [
        recognizedWords,
        finalResult,
      ];
}
