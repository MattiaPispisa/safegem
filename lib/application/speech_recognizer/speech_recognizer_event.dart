part of 'speech_recognizer_bloc.dart';

/// base class speech recognizer events
sealed class SpeechRecognizerEvent extends Equatable {
  const SpeechRecognizerEvent();

  @override
  List<Object> get props => [];
}

/// speech started
final class SpeechRecognizerStarted extends SpeechRecognizerEvent {}

/// speech end
final class SpeechRecognizerEnd extends SpeechRecognizerEvent {}

/// speech recognized
final class _SpeechRecognizerRecognized extends SpeechRecognizerEvent {
  const _SpeechRecognizerRecognized({required this.result});

  final SpeechRecognizerResult result;

  @override
  List<Object> get props => [result];
}

/// toggle between speech started and stopped
final class SpeechRecognizerToggledSpeech extends SpeechRecognizerEvent {}
