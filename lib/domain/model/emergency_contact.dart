import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'emergency_contact.g.dart';

@JsonSerializable()
class EmergencyContact extends Equatable {
  const EmergencyContact({
    required this.displayName,
    required this.number,
  });

  final String displayName;
  final String number;

  factory EmergencyContact.fromJson(Map<String, dynamic> json) =>
      _$EmergencyContactFromJson(json);

  Map<String, dynamic> toJson() => _$EmergencyContactToJson(this);

  @override
  List<Object?> get props => [
        displayName,
        number,
      ];
}
