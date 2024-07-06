part of 'emergency_contact_bloc.dart';

final class EmergencyContactState extends Equatable {
  const EmergencyContactState({
    required this.name,
    required this.number,
    required this.emptyName,
    required this.invalidNumber,
    required this.showError,
    required this.optionOrEmergencyContactCreated,
  });

  factory EmergencyContactState.initial({
    EmergencyContact? emergencyContact,
  }) {
    if (emergencyContact == null) {
      return EmergencyContactState(
        name: '',
        number: '',
        emptyName: true,
        invalidNumber: true,
        optionOrEmergencyContactCreated: none(),
        showError: false,
      );
    }

    return EmergencyContactState(
      name: emergencyContact.displayName,
      number: emergencyContact.number,
      emptyName: false,
      invalidNumber: false,
      optionOrEmergencyContactCreated: none(),
      showError: false,
    );
  }

  final String name;
  final String number;

  final bool emptyName;
  final bool invalidNumber;

  final bool showError;

  final Option<EmergencyContact> optionOrEmergencyContactCreated;

  EmergencyContactState copyWith({
    String? name,
    String? number,
    bool? emptyName,
    bool? invalidNumber,
    bool? showError,
    Option<EmergencyContact>? optionOrEmergencyContactCreated,
  }) {
    return EmergencyContactState(
      emptyName: emptyName ?? this.emptyName,
      invalidNumber: invalidNumber ?? this.invalidNumber,
      name: name ?? this.name,
      number: number ?? this.number,
      optionOrEmergencyContactCreated:
          optionOrEmergencyContactCreated ?? none(),
      showError: showError ?? this.showError,
    );
  }

  @override
  List<Object> get props => [
        name,
        number,
        emptyName,
        invalidNumber,
        showError,
        optionOrEmergencyContactCreated,
      ];
}
