import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:safegem/domain/model/model.dart';

import '../../domain/domain.dart';

part 'speech_recognizer_event.dart';
part 'speech_recognizer_state.dart';

@injectable
class SpeechRecognizerBloc
    extends Bloc<SpeechRecognizerEvent, SpeechRecognizerState> {
  SpeechRecognizerBloc(this._speechRecognizerService)
      : super(SpeechRecognizerState.initial()) {
    on<SpeechRecognizerStarted>(_onSpeechStarted);
    on<SpeechRecognizerEnd>(_onSpeechEnd);
    on<SpeechRecognizerToggledSpeech>(_onToggleSpeech);
    on<SpeechRecognizerRecognized>(_onRecognized);
  }

  final SpeechRecognizerService _speechRecognizerService;

  FutureOr<void> _onSpeechStarted(
    SpeechRecognizerStarted event,
    Emitter<SpeechRecognizerState> emit,
  ) {
    if (state.isListening) {
      _speechRecognizerService.stop();
    }
    emit(state.copyWith(isListening: true));
    _speechRecognizerService
        .listen((result) => add(SpeechRecognizerRecognized(result: result)));
  }

  FutureOr<void> _onSpeechEnd(
    SpeechRecognizerEnd event,
    Emitter<SpeechRecognizerState> emit,
  ) {
    _speechRecognizerService.stop();
    emit(
      state.copyWith(
          isListening: false,
          optionOrMessageRecognized: state.optionOrMessageRecognizedEnd),
    );
  }

  @override
  Future<void> close() {
    _speechRecognizerService.stop();
    return super.close();
  }

  FutureOr<void> _onToggleSpeech(
    SpeechRecognizerToggledSpeech event,
    Emitter<SpeechRecognizerState> emit,
  ) async {
    if (state.isListening) {
      return add(SpeechRecognizerEnd());
    }

    return add(SpeechRecognizerStarted());
  }

  FutureOr<void> _onRecognized(
    SpeechRecognizerRecognized event,
    Emitter<SpeechRecognizerState> emit,
  ) async {
    final result = event.result;

    if (isClosed || !state.isListening) {
      return;
    }

    if (!result.finalResult) {
      return emit(state.copyWith(
        recognizedWords: result.recognizedWords,
        isListening: true,
      ));
    }

    emit(
      state.copyWith(
        recognizedWords: result.recognizedWords,
        isListening: false,
        optionOrMessageRecognized: some(
          UserMessage(
            message: result.recognizedWords,
          ),
        ),
      ),
    );
  }
}
