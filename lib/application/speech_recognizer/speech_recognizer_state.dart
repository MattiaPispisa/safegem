part of 'speech_recognizer_bloc.dart';

/// [SpeechRecognizerBloc] state
final class SpeechRecognizerState extends Equatable {
  /// constructor
  const SpeechRecognizerState({
    required this.isListening,
    required this.optionOrMessageRecognizedEnd,
    required this.recognizedWords,
    required this.isAvailable,
  });

  /// [SpeechRecognizerBloc] initial state
  factory SpeechRecognizerState.initial({
    required bool isAvailable,
  }) {
    return SpeechRecognizerState(
      isListening: false,
      optionOrMessageRecognizedEnd: none(),
      recognizedWords: '',
      isAvailable: isAvailable,
    );
  }

  /// is speech recognizer is available
  final bool isAvailable;

  /// is listening speech
  final bool isListening;

  /// at the end of speech some [UserMessage] is recognized
  final Option<UserMessage> optionOrMessageRecognizedEnd;

  /// current recognized words
  final String recognizedWords;

  /// default coyWith
  SpeechRecognizerState copyWith({
    bool? isListening,
    Option<UserMessage>? optionOrMessageRecognized,
    String? recognizedWords,
    bool? isAvailable,
  }) {
    return SpeechRecognizerState(
      isListening: isListening ?? this.isListening,
      optionOrMessageRecognizedEnd: optionOrMessageRecognized ?? none(),
      recognizedWords: recognizedWords ?? this.recognizedWords,
      isAvailable: isAvailable ?? this.isAvailable,
    );
  }

  @override
  List<Object> get props => [
        isListening,
        optionOrMessageRecognizedEnd,
        recognizedWords,
        isAvailable,
      ];
}
