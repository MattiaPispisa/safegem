import 'package:dartz/dartz.dart';
import 'package:safegem/domain/failure/emergency_message_failure.dart';
import 'package:safegem/domain/failure/send_message_failure.dart';
import 'package:safegem/domain/model/model.dart';

abstract class EmergencyService {
  const EmergencyService();

  Future<Either<EmergencyMessageFailure, EmergencyMessage>> getEmergencyMessage(
    GetEmergencyMessageDto dto,
  );
  Future<Either<SendMessageFailure, Unit>> sendEmergencyMessage(
    EmergencyMessage message,
  );
}

class GetEmergencyMessageDto {
  const GetEmergencyMessageDto({
    required this.location,
    required this.message,
    required this.senderContactInfo,
  });

  final Location location;
  final UserMessage message;
  final SenderContactInfo? senderContactInfo;
}
