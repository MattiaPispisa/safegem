import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:safegem/domain/domain.dart';

part 'emergency_composer_event.dart';
part 'emergency_composer_state.dart';

@injectable
class EmergencyComposerBloc
    extends Bloc<EmergencyComposerEvent, EmergencyComposerState> {
  EmergencyComposerBloc(this._emergencyService)
      : super(EmergencyComposerState.initial()) {
    on<EmergencyMessageSent>(_onMessageSent);
  }

  final EmergencyService _emergencyService;

  FutureOr<void> _onMessageSent(
    EmergencyMessageSent event,
    Emitter<EmergencyComposerState> emit,
  ) async {
    emit(state.copyWith(composingMessage: true));
    final emergencyMessage = await _emergencyService.getEmergencyMessage(
      GetEmergencyMessageDto(
        location: event.location,
        message: event.message,
        senderContactInfo: event.senderContactInfo,
      ),
    );
  }
}
