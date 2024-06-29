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
    _speechRecognizerService.listen((result) => onRecognition(result, emit));
  }

  void onRecognition(
      SpeechRecognizerResult result, Emitter<SpeechRecognizerState> emit) {
    if (isClosed || !state.isListening) {
      return;
    }

    if (result.finalResult) {
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

    emit(state.copyWith(recognizedWords: result.recognizedWords));
  }

  FutureOr<void> _onSpeechEnd(
    SpeechRecognizerEnd event,
    Emitter<SpeechRecognizerState> emit,
  ) {
    _speechRecognizerService.stop();
    emit(state.copyWith(isListening: false));
  }

  @override
  Future<void> close() {
    _speechRecognizerService.stop();
    return super.close();
  }
}
