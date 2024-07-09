import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'emergency_contact.g.dart';

/// A personal emergency contact of the user.
@JsonSerializable()
class EmergencyContact extends Equatable {
  /// constructor
  const EmergencyContact({
    required this.displayName,
    required this.number,
  });

  /// from json
  factory EmergencyContact.fromJson(Map<String, dynamic> json) =>
      _$EmergencyContactFromJson(json);

  /// emergency contact display name
  final String displayName;

  /// emergency contact number
  final String number;

  /// to json
  Map<String, dynamic> toJson() => _$EmergencyContactToJson(this);

  @override
  List<Object?> get props => [
        displayName,
        number,
      ];
}
