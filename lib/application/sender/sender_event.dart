part of 'sender_bloc.dart';

sealed class SenderEvent extends Equatable {
  const SenderEvent();
}

final class SenderMessageSent extends SenderEvent {
  const SenderMessageSent({
    required this.wait,
    required this.emergencyMessage,
  });

  final Duration wait;
  final EmergencyMessage emergencyMessage;

  @override
  List<Object?> get props => [
        wait,
        emergencyMessage,
      ];
}

final class SenderUndoSent extends SenderEvent {
  const SenderUndoSent();

  @override
  List<Object?> get props => [];
}
