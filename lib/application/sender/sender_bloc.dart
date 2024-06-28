import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sender_event.dart';
part 'sender_state.dart';

class SenderBloc extends Bloc<SenderEvent, SenderState> {
  SenderBloc() : super(SenderInitial()) {
    on<SenderEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
