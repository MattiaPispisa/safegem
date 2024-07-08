part of 'sender_bloc.dart';

/// state of [SenderBloc]
final class SenderState extends Equatable {
  /// constructor
  const SenderState({
    required this.sending,
    required this.timerBeforeSend,
    required this.optionFailureOrMessageSent,
    required this.emergencyMessage,
  });

  /// [SenderBloc] initial state
  factory SenderState.initial() {
    return SenderState(
      sending: false,
      timerBeforeSend: none(),
      optionFailureOrMessageSent: none(),
      emergencyMessage: none(),
    );
  }

  /// is sending [emergencyMessage]
  final bool sending;

  /// delay before sending
  final Option<int> timerBeforeSend;

  /// after sending some is returned. Failure if an error is return else unit
  final Option<Either<SendMessageFailure, Unit>> optionFailureOrMessageSent;

  /// emergency message to send
  final Option<EmergencyMessage> emergencyMessage;

  /// default copy with
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
