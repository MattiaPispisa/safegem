part of 'emergency_composer_bloc.dart';

sealed class EmergencyComposerEvent extends Equatable {
  const EmergencyComposerEvent();
}

final class EmergencyMessageSent extends EmergencyComposerEvent {
  const EmergencyMessageSent({
    required this.location,
    required this.message,
    required this.senderContactInfo,
  });

  final Location location;
  final UserMessage message;
  final SenderContactInfo? senderContactInfo;

  @override
  List<Object?> get props => [
        location,
        message,
        senderContactInfo,
      ];
}
