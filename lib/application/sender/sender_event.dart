part of 'sender_bloc.dart';

/// base class for [SenderBloc]
sealed class SenderEvent extends Equatable {
  const SenderEvent();
}

/// event on message sent
final class SenderMessageSent extends SenderEvent {
  /// constructor
  const SenderMessageSent({
    required this.emergencyMessage,
  });

  /// emergency message to sent
  final EmergencyMessage emergencyMessage;

  @override
  List<Object?> get props => [
        emergencyMessage,
      ];
}
