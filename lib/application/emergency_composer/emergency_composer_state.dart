part of 'emergency_composer_bloc.dart';

/// Business logic state
class EmergencyComposerState extends Equatable {
  /// constructor
  const EmergencyComposerState({
    required this.composingMessage,
    required this.optionFailureOrMessageCreated,
    required this.userMessage,
  });

  /// factory for initial state
  factory EmergencyComposerState.initial() {
    return EmergencyComposerState(
      composingMessage: false,
      optionFailureOrMessageCreated: none(),
      userMessage: none(),
    );
  }

  /// default copyWith except for
  ///
  /// - if [optionFailureOrMessageCreated] is null, [none] is copied.
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

  /// message under loading
  final bool composingMessage;

  /// user message used to crate the emergency message
  final Option<UserMessage> userMessage;

  /// result of ia computation. Once the work is done some is returned.
  /// A failure if an error is encountered else the emergency message
  final Option<Either<EmergencyMessageFailure, EmergencyMessage>>
      optionFailureOrMessageCreated;

  @override
  List<Object> get props => [
        composingMessage,
        optionFailureOrMessageCreated,
        userMessage,
      ];
}
