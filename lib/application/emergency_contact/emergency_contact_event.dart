part of 'emergency_contact_bloc.dart';

sealed class EmergencyContactEvent extends Equatable {
  const EmergencyContactEvent();

  @override
  List<Object> get props => [];
}

final class EmergencyContactChangedName extends EmergencyContactEvent {
  const EmergencyContactChangedName({
    required this.name,
  });

  final String name;

  @override
  List<Object> get props => [name];
}

final class EmergencyContactChangedNumber extends EmergencyContactEvent {
  const EmergencyContactChangedNumber({
    required this.number,
  });

  final String number;

  @override
  List<Object> get props => [number];
}

final class EmergencyContactSubmitted extends EmergencyContactEvent {
  const EmergencyContactSubmitted();

  @override
  List<Object> get props => [];
}
