part of 'emergency_composer_bloc.dart';

class EmergencyComposerState extends Equatable {
  const EmergencyComposerState({
    required this.composingMessage,
    required this.optionFailureOrMessageCreated,
    required this.userMessage,
  });

  factory EmergencyComposerState.initial() {
    return EmergencyComposerState(
      composingMessage: false,
      optionFailureOrMessageCreated: none(),
      userMessage: none(),
    );
  }

  EmergencyComposerState copyWith({
    bool? composingMessage,
    Option<Either<EmergencyMessageFailure, EmergencyMessage>>?
        optionFailureOrMessageCreated,
    Option<UserMessage>? userMessage,
  }) {
    return EmergencyComposerState(
      composingMessage: composingMessage ?? this.composingMessage,
      optionFailureOrMessageCreated: optionFailureOrMessageCreated ?? none(),
      userMessage: userMessage ?? this.userMessage,
    );
  }

  final bool composingMessage;
  final Option<UserMessage> userMessage;
  final Option<Either<EmergencyMessageFailure, EmergencyMessage>>
      optionFailureOrMessageCreated;

  @override
  List<Object> get props => [
        composingMessage,
        optionFailureOrMessageCreated,
        userMessage,
      ];
}
