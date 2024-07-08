part of 'emergency_contact_bloc.dart';

/// state of [EmergencyContactBloc]
final class EmergencyContactState extends Equatable {
  /// constructor
  const EmergencyContactState({
    required this.name,
    required this.number,
    required this.emptyName,
    required this.invalidNumber,
    required this.showError,
    required this.optionOrEmergencyContactCreated,
  });

  /// [EmergencyContactBloc] initial state.
  ///
  /// if [emergencyContact] is not null,
  /// [EmergencyContactState] is filled using [emergencyContact].
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

  /// contact name
  final String name;

  /// contact number
  final String number;

  /// `true` if name is empty
  final bool emptyName;

  /// `true` if [number] is not a valid number
  final bool invalidNumber;

  /// `true` to show error on ui
  final bool showError;

  /// result of creation/edit. Once the work is done some emergency contact  is returned.
  final Option<EmergencyContact> optionOrEmergencyContactCreated;

  /// default copy with except for:
  ///
  /// - [optionOrEmergencyContactCreated], if null [none] is copied
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
