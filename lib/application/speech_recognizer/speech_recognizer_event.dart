part of 'speech_recognizer_bloc.dart';

sealed class SpeechRecognizerEvent extends Equatable {
  const SpeechRecognizerEvent();

  @override
  List<Object> get props => [];
}

final class SpeechRecognizerStarted extends SpeechRecognizerEvent {}

final class SpeechRecognizerEnd extends SpeechRecognizerEvent {}
