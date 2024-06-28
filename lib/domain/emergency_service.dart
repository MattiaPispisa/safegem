import 'package:dartz/dartz.dart';
import 'package:safegem/domain/failure/emergency_message_failure.dart';
import 'package:safegem/domain/failure/send_message_failure.dart';
import 'package:safegem/domain/model/model.dart';

abstract class EmergencyService {
  const EmergencyService();

  Future<Either<EmergencyMessageFailure, EmergencyMessage>>
      getEmergencyMessage();
  Future<Either<SendMessageFailure, Unit>> sendEmergencyMessage();
}
