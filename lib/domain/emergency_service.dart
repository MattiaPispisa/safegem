import 'package:dartz/dartz.dart';
import 'package:safegem/domain/failure/emergency_message_failure.dart';
import 'package:safegem/domain/failure/send_message_failure.dart';
import 'package:safegem/domain/model/model.dart';

/// Service that contains all the necessary methods
/// for composing and sending an emergency message.
abstract interface class EmergencyService {
  /// async method to return an [EmergencyMessage]
  ///
  /// if some errors are encountered
  /// an [EmergencyMessageFailure] failure is returned
  Future<Either<EmergencyMessageFailure, EmergencyMessage>> getEmergencyMessage(
    GetEmergencyMessageDto dto,
  );

  /// async method to send a [message]
  ///
  /// if some errors are encountered
  /// an [SendMessageFailure] failure is returned
  Future<Either<SendMessageFailure, Unit>> sendEmergencyMessage(
    EmergencyMessage message,
  );
}

/// Dto for [EmergencyService.getEmergencyMessage] parameters
class GetEmergencyMessageDto {
  /// constructor
  const GetEmergencyMessageDto({
    required this.location,
    required this.message,
    required this.senderContactInfo,
  });

  /// [message] location
  final Location location;

  /// user message
  final UserMessage message;

  /// optional user contact info
  final SenderContactInfo? senderContactInfo;
}
