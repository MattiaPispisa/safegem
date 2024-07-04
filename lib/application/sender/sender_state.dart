part of 'sender_bloc.dart';

final class SenderState extends Equatable {
  const SenderState({
    required this.sending,
    required this.timerBeforeSend,
    required this.optionFailureOrMessageSent,
    required this.emergencyMessage,
  });

  factory SenderState.initial() {
    return SenderState(
      sending: false,
      timerBeforeSend: none(),
      optionFailureOrMessageSent: none(),
      emergencyMessage: none(),
    );
  }

  final bool sending;
  final Option<int> timerBeforeSend;
  final Option<Either<SendMessageFailure, Unit>> optionFailureOrMessageSent;
  final Option<EmergencyMessage> emergencyMessage;

  SenderState copyWith({
    bool? sending,
    Option<int>? timerBeforeSend,
    Option<Either<SendMessageFailure, Unit>>? optionFailureOrMessageSent,
    Option<EmergencyMessage>? emergencyMessage,
  }) {
    return SenderState(
      sending: sending ?? this.sending,
      optionFailureOrMessageSent: optionFailureOrMessageSent ?? none(),
      timerBeforeSend: timerBeforeSend ?? none(),
      emergencyMessage: emergencyMessage ?? this.emergencyMessage,
    );
  }

  @override
  List<Object> get props => [
        sending,
        timerBeforeSend,
        optionFailureOrMessageSent,
        emergencyMessage,
      ];
}
