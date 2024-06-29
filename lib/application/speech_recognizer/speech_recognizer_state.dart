part of 'speech_recognizer_bloc.dart';

final class SpeechRecognizerState extends Equatable {
  const SpeechRecognizerState({
    required this.isListening,
    required this.optionOrMessageRecognizedEnd,
    required this.recognizedWords,
  });

  factory SpeechRecognizerState.initial() {
    return SpeechRecognizerState(
      isListening: false,
      optionOrMessageRecognizedEnd: none(),
      recognizedWords: '',
    );
  }

  final bool isListening;
  final Option<UserMessage> optionOrMessageRecognizedEnd;
  final String recognizedWords;

  SpeechRecognizerState copyWith({
    bool? isListening,
    Option<UserMessage>? optionOrMessageRecognized,
    String? recognizedWords,
  }) {
    return SpeechRecognizerState(
      isListening: isListening ?? this.isListening,
      optionOrMessageRecognizedEnd: optionOrMessageRecognized ?? none(),
      recognizedWords: recognizedWords ?? this.recognizedWords,
    );
  }

  @override
  List<Object> get props => [
        isListening,
        optionOrMessageRecognizedEnd,
        recognizedWords,
      ];
}
