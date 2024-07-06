import 'package:equatable/equatable.dart';

class EmergencyMessage extends Equatable {
  const EmergencyMessage({
    required this.message,
    required this.authorityNumber,
    required this.sms,
    required this.phone,
  });

  final String authorityNumber;
  final String message;
  final Uri sms;
  final Uri phone;

  @override
  List<Object?> get props => [
        message,
        authorityNumber,
        sms,
        phone,
      ];
}
