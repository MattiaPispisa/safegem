import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'emergency_composer_event.dart';
part 'emergency_composer_state.dart';

class EmergencyComposerBloc extends Bloc<EmergencyComposerEvent, EmergencyComposerState> {
  EmergencyComposerBloc() : super(EmergencyComposerInitial()) {
    on<EmergencyComposerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
