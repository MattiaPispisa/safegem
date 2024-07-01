import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:safegem/application/sender/count_down.dart';

import '../../domain/domain.dart';

part 'sender_event.dart';
part 'sender_state.dart';

class SenderBloc extends Bloc<SenderEvent, SenderState> {
  SenderBloc(this._emergencyService) : super(SenderState.initial()) {
    on<SenderMessageSent>(_onMessageSent);
    on<SenderUndoSent>(_onUndoSent);
  }

  final EmergencyService _emergencyService;
  CountDown? _countDown;

  FutureOr<void> _onMessageSent(
    SenderMessageSent event,
    Emitter<SenderState> emit,
  ) async {
    _countDown?.cancel();

    if (state.sending) {
      return;
    }
    if (event.wait.isNegative) {
      return;
    }
    if (event.wait.inSeconds == 0) {
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
  }

  FutureOr<void> _onUndoSent(
    SenderUndoSent event,
    Emitter<SenderState> emit,
  ) async {
    if (!_canUndo) {
      return;
    }
    _countDown?.cancel();
    emit(state.copyWith(sending: false));
  }

  Future<void> _onTimerEnd(
    EmergencyMessage message,
    Emitter<SenderState> emit,
  ) async {
    _countDown?.cancel();
    _safeEmit(() => emit(state.copyWith(sending: true)));
    final eitherSent = await _emergencyService.sendEmergencyMessage(message);
    _safeEmit(() => emit(
          state.copyWith(
            optionFailureOrMessageSent: some(eitherSent),
            sending: false,
            timerBeforeSend: none(),
          ),
        ));
  }

  void _safeEmit(VoidCallback callback) {
    if (isClosed) {
      return;
    }
    callback();
  }

  bool get _canUndo {
    return state.sending && _countDown != null;
  }
}
