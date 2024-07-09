import 'package:equatable/equatable.dart';

/// An emergency message containing
/// all the information needed to quickly send the content.
class EmergencyMessage extends Equatable {
  /// constructor
  const EmergencyMessage({
    required this.message,
    required this.authorityNumber,
    required this.sms,
    required this.phone,
  });

  /// The phone number to send the emergency message to.
  final String authorityNumber;

  /// The message content
  final String message;

  /// sms uri
  final Uri sms;

  /// phone uri
  final Uri phone;

  @override
  List<Object?> get props => [
        message,
        authorityNumber,
        sms,
        phone,
      ];
}
