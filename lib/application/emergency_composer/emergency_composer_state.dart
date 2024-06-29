part of 'emergency_composer_bloc.dart';

class EmergencyComposerState extends Equatable {
  const EmergencyComposerState({
    required this.composingMessage,
    required this.optionFailureOrMessageCreated,
  });

  factory EmergencyComposerState.initial() {
    return EmergencyComposerState(
      composingMessage: false,
      optionFailureOrMessageCreated: none(),
    );
  }

  EmergencyComposerState copyWith({
    bool? composingMessage,
    Option<EmergencyMessageFailure>? optionFailureOrMessageCreated,
  }) {
    return EmergencyComposerState(
      composingMessage: composingMessage ?? this.composingMessage,
      optionFailureOrMessageCreated: optionFailureOrMessageCreated ?? none(),
    );
  }

  final bool composingMessage;
  final Option<EmergencyMessageFailure> optionFailureOrMessageCreated;

  @override
  List<Object> get props => [
        composingMessage,
        optionFailureOrMessageCreated,
      ];
}
