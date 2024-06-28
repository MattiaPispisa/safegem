part of 'speech_recognizer_bloc.dart';

final class SpeechRecognizerState extends Equatable {
  const SpeechRecognizerState({
    required this.isListening,
    required this.optionOrMessageRecognized,
  });

  final bool isListening;
  final Option<UserMessage> optionOrMessageRecognized;

  SpeechRecognizerState copyWith({
    bool? isListening,
    Option<UserMessage>? optionOrMessageRecognized,
  }) {
    return SpeechRecognizerState(
      isListening: isListening ?? this.isListening,
      optionOrMessageRecognized:
          optionOrMessageRecognized ?? this.optionOrMessageRecognized,
    );
  }

  @override
  List<Object> get props => [
        isListening,
        optionOrMessageRecognized,
      ];
}
