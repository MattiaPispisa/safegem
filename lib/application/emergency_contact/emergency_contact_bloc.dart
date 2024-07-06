import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../domain/domain.dart';

part 'emergency_contact_event.dart';
part 'emergency_contact_state.dart';

class EmergencyContactBlocParams {
  const EmergencyContactBlocParams({
    required this.emergencyContact,
  });

  final EmergencyContact? emergencyContact;
}

@injectable
class EmergencyContactBloc
    extends Bloc<EmergencyContactEvent, EmergencyContactState> {
  EmergencyContactBloc(@factoryParam EmergencyContactBlocParams params)
      : super(
          EmergencyContactState.initial(
              emergencyContact: params.emergencyContact),
        ) {
    on<EmergencyContactChangedName>(_onChangedName);
    on<EmergencyContactChangedNumber>(_onChangedNumber);
    on<EmergencyContactSubmitted>(_onSubmit);
  }

  FutureOr<void> _onChangedName(
    EmergencyContactChangedName event,
    Emitter<EmergencyContactState> emit,
  ) {
    emit(
      state.copyWith(name: event.name, emptyName: event.name.isEmpty),
    );
  }

  FutureOr<void> _onChangedNumber(
    EmergencyContactChangedNumber event,
    Emitter<EmergencyContactState> emit,
  ) {
    emit(
      state.copyWith(number: event.number, invalidNumber: event.number.isEmpty),
    );
  }

  FutureOr<void> _onSubmit(
    EmergencyContactSubmitted event,
    Emitter<EmergencyContactState> emit,
  ) {
    if (_isStateNotValid) {
      emit(
        state.copyWith(showError: true),
      );
    }

    emit(
      state.copyWith(
        optionOrEmergencyContactCreated: some(
          EmergencyContact(displayName: state.name, number: state.number),
        ),
      ),
    );
  }

  bool get _isStateNotValid {
    return state.emptyName || state.invalidNumber;
  }
}
