part of 'emergency_contact_bloc.dart';

/// base class for emergency contact events
sealed class EmergencyContactEvent extends Equatable {
  const EmergencyContactEvent();

  @override
  List<Object> get props => [];
}

/// on changed name event
final class EmergencyContactChangedName extends EmergencyContactEvent {
  /// constructor
  const EmergencyContactChangedName({
    required this.name,
  });

  /// new name
  final String name;

  @override
  List<Object> get props => [name];
}

/// on changed number
final class EmergencyContactChangedNumber extends EmergencyContactEvent {
  /// constructor
  const EmergencyContactChangedNumber({
    required this.number,
  });

  /// new number
  final String number;

  @override
  List<Object> get props => [number];
}

/// event to submit the emergency contact
final class EmergencyContactSubmitted extends EmergencyContactEvent {
  /// constructor
  const EmergencyContactSubmitted();

  @override
  List<Object> get props => [];
}
