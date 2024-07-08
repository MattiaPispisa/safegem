part of 'emergency_composer_bloc.dart';

/// Base event class
sealed class EmergencyComposerEvent extends Equatable {
  const EmergencyComposerEvent();
}

/// message sent
final class EmergencyMessageSent extends EmergencyComposerEvent {
  /// constructor
  const EmergencyMessageSent({
    required this.location,
    required this.message,
    required this.senderContactInfo,
  });

  /// user location
  final Location location;

  /// user message
  final UserMessage message;

  /// optional user contact info
  final SenderContactInfo? senderContactInfo;

  @override
  List<Object?> get props => [
        location,
        message,
        senderContactInfo,
      ];
}
