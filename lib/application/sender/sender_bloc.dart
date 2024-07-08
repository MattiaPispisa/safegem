import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import 'package:safegem/domain/domain.dart';

part 'sender_event.dart';
part 'sender_state.dart';

/// Business logic to handle sending emergency message.
///
/// At this moment, it is a partial version as the message sending is handled
/// through `launchUri` towards the default messaging application.
/// The goal is to create an automation where this app manages the messages
/// and possibly initiates the call as well.
@injectable
class SenderBloc extends Bloc<SenderEvent, SenderState> {
  /// constructor
  SenderBloc() : super(SenderState.initial()) {
    on<SenderMessageSent>(_onMessageSent);
    // on<SenderUndoSent>(_onUndoSent);
  }

  // final EmergencyService _emergencyService;
  // CountDown? _countDown;

  FutureOr<void> _onMessageSent(
    SenderMessageSent event,
    Emitter<SenderState> emit,
  ) async {
    // _countDown?.cancel();

    emit(state.copyWith(emergencyMessage: some(event.emergencyMessage)));

    /* 
    // for a future implementation
    final wait = event.wait.isNegative ? Duration(seconds: 0) : event.wait;

    if (wait.inSeconds == 0) {
      return _onTimerEnd(event.emergencyMessage, emit);
    } 

     _countDown = CountDown(
      duration: event.wait,
      onTick: (tick) {
        _safeEmit(() => emit(state.copyWith(timerBeforeSend: some(tick))));
      },
      onEnd: () {
        _safeEmit(() => emit(state.copyWith(timerBeforeSend: none())));
        _onTimerEnd(event.emergencyMessage, emit);
      },
    );
    return; 
    */
  }

  /* FutureOr<void> _onUndoSent(
    SenderUndoSent event,
    Emitter<SenderState> emit,
  ) async {
    if (!_canUndo) {
      return;
    }
    _countDown?.cancel();
    emit(state.copyWith(sending: false));
  } */

  /* Future<void> _onTimerEnd(
    EmergencyMessage message,
    Emitter<SenderState> emit,
  ) async {
    _countDown?.cancel();
    _safeEmit(() => emit(state.copyWith(sending: true)));
    final eitherSent = await _emergencyService.sendEmergencyMessage(message);
    _safeEmit(
      () => emit(
        state.copyWith(
          optionFailureOrMessageSent: some(eitherSent),
          sending: false,
          timerBeforeSend: none(),
        ),
      ),
    );
  } */

  /* void _safeEmit(VoidCallback callback) {
    if (isClosed) {
      return;
    }
    callback();
  } */

  /* bool get _canUndo {
    return state.sending && _countDown != null;
  } */
}
