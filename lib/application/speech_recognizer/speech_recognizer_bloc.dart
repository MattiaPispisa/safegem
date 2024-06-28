import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:safegem/domain/model/model.dart';

part 'speech_recognizer_event.dart';
part 'speech_recognizer_state.dart';

class SpeechRecognizerBloc extends Bloc<SpeechRecognizerEvent, SpeechRecognizerState> {
  SpeechRecognizerBloc() : super(SpeechRecognizerInitial()) {
    on<SpeechRecognizerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
