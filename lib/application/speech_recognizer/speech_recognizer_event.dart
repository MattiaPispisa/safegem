part of 'speech_recognizer_bloc.dart';

sealed class SpeechRecognizerEvent extends Equatable {
  const SpeechRecognizerEvent();

  @override
  List<Object> get props => [];
}

final class SpeechRecognizerStarted extends SpeechRecognizerEvent {}

final class SpeechRecognizerEnd extends SpeechRecognizerEvent {}

final class SpeechRecognizerRecognized extends SpeechRecognizerEvent {
  const SpeechRecognizerRecognized({required this.result});

  final SpeechRecognizerResult result;

  @override
  List<Object> get props => [result];
}

final class SpeechRecognizerToggledSpeech extends SpeechRecognizerEvent {}
