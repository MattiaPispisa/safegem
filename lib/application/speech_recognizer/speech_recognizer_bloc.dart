import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:safegem/domain/domain.dart';

part 'speech_recognizer_event.dart';
part 'speech_recognizer_state.dart';

/// Business logic to recognize speech and convert it in text
@injectable
class SpeechRecognizerBloc
    extends Bloc<SpeechRecognizerEvent, SpeechRecognizerState> {
  /// constructor
  SpeechRecognizerBloc(this._speechRecognizerService)
      : super(
          SpeechRecognizerState.initial(
            isAvailable: _speechRecognizerService.available(),
          ),
        ) {
    on<SpeechRecognizerStarted>(_onSpeechStarted);
    on<SpeechRecognizerEnd>(_onSpeechEnd);
    on<SpeechRecognizerToggledSpeech>(_onToggleSpeech);
    on<_SpeechRecognizerRecognized>(_onRecognized);
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
        .listen((result) => add(_SpeechRecognizerRecognized(result: result)));
  }

  FutureOr<void> _onSpeechEnd(
    SpeechRecognizerEnd event,
    Emitter<SpeechRecognizerState> emit,
  ) {
    emit(
      state.copyWith(
        isListening: false,
      ),
    );
    _speechRecognizerService.stop();
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
    _SpeechRecognizerRecognized event,
    Emitter<SpeechRecognizerState> emit,
  ) async {
    final result = event.result;

    if (!result.finalResult) {
      return emit(
        state.copyWith(
          recognizedWords: result.recognizedWords,
          isListening: true,
        ),
      );
    }

    emit(
      state.copyWith(
        recognizedWords: result.recognizedWords,
        isListening: false,
        optionOrMessageRecognized: some(
          UserMessage(
            content: result.recognizedWords,
          ),
        ),
      ),
    );
  }
}
