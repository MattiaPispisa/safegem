part of 'sender_bloc.dart';

final class SenderState extends Equatable {
  const SenderState({
    required this.sending,
    required this.timerBeforeSend,
    required this.optionFailureOrMessageSent,
  });

  factory SenderState.initial() {
    return SenderState(
      sending: false,
      timerBeforeSend: none(),
      optionFailureOrMessageSent: none(),
    );
  }

  final bool sending;
  final Option<int> timerBeforeSend;
  final Option<Either<SendMessageFailure, Unit>> optionFailureOrMessageSent;

  SenderState copyWith({
    bool? sending,
    Option<int>? timerBeforeSend,
    Option<Either<SendMessageFailure, Unit>>? optionFailureOrMessageSent,
  }) {
    return SenderState(
      sending: sending ?? this.sending,
      optionFailureOrMessageSent: optionFailureOrMessageSent ?? none(),
      timerBeforeSend: timerBeforeSend ?? none(),
    );
  }

  @override
  List<Object> get props => [];
}
