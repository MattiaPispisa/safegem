import 'package:equatable/equatable.dart';

class EmergencyMessage extends Equatable {
  const EmergencyMessage({
    required this.message,
    required this.authorityNumber,
    required this.sms,
  });

  final String authorityNumber;
  final String message;
  final Uri sms;

  @override
  List<Object?> get props => [
        message,
        authorityNumber,
        sms,
      ];
}
