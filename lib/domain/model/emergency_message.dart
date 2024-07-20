import 'package:equatable/equatable.dart';

/// An emergency message containing
/// all the information needed to quickly send the content.
class EmergencyMessage extends Equatable {
  /// constructor
  const EmergencyMessage({
    required this.authorityName,
    required this.message,
    required this.authorityNumber,
  });

  /// The authority name
  final String authorityName;

  /// The phone number to send the emergency message to.
  final String authorityNumber;

  /// The message content
  final String message;

  @override
  List<Object?> get props => [
        message,
        authorityNumber,
      ];
}
