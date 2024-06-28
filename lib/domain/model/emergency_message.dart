import 'package:equatable/equatable.dart';

class EmergencyMessage extends Equatable {
  const EmergencyMessage({
    required this.message,
    required this.authorityNumber,
  });

  final String authorityNumber;
  final String message;

  @override
  List<Object?> get props => [message, authorityNumber];
}
