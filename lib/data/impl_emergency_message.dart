import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:safegem/data/ai.dart';
import 'package:safegem/domain/domain.dart';

// phone reg exp inside text
final RegExp _phoneRegExp = RegExp(r'\+?\d[\d-. ]*(?:\d)');

/// [EmergencyService] implementation using an [AI] service
@LazySingleton(as: EmergencyService)
class ImplEmergencyService implements EmergencyService {
  /// constructor
  const ImplEmergencyService(this._ai);

  final AI _ai;

  @override
  Future<Either<EmergencyMessageFailure, EmergencyMessage>> getEmergencyMessage(
    GetEmergencyMessageDto dto,
  ) async {
    String? authorityName;
    String? number;
    String? localizedMessage;

    try {
      localizedMessage = await _localizedMessage(dto);
    } on AIUnsupportedLocationException catch (e) {
      return left(EmergencyMessageUnsupportedUserLocation(e.toString()));
    } catch (e) {
      localizedMessage = null;
    }

    try {
      (authorityName, number) = await _mostAppropriatedNumber(dto);
    } on AIUnsupportedLocationException catch (e) {
      return left(EmergencyMessageUnsupportedUserLocation(e.toString()));
    } catch (e) {
      number = null;
    }

    if (number == null || authorityName == null) {
      return left(
        EmergencyMessageAuthorityNumberNotFound(
          message: localizedMessage ?? '',
        ),
      );
    }

    if (localizedMessage == null) {
      return left(
        EmergencyMessageNotRecognized(
          authorityNumber: number,
        ),
      );
    }

    return right(
      EmergencyMessage(
        authorityName: authorityName,
        authorityNumber: number,
        message: localizedMessage,
      ),
    );
  }

  Future<(String, String)> _mostAppropriatedNumber(
    GetEmergencyMessageDto dto,
  ) async {
    final message = 'I am at the following geographic coordinates: '
        'latitude "${dto.location.latitude}"'
        ' longitude "${dto.location.longitude}". '
        'This is happening: "${dto.message.content}". '
        'Give me the phone number of the most appropriate authority '
        'in the following format: authority name: number, '
        "don't write anything else. "
        'Use the authority name of the local language '
        'of the geographic coordinates.';
    final response = await _ai.generateContent(message);
    final bestCandidateMessage = response.text!;

    final name = bestCandidateMessage.split(':').first;
    final number = _phoneRegExp.firstMatch(bestCandidateMessage)![0]!;
    return (name, number);
  }

  Future<String> _localizedMessage(
    GetEmergencyMessageDto dto,
  ) async {
    final message =
        'Translate into the local language of the geographic coordinates; '
        'latitude "${dto.location.latitude}", '
        'longitude "${dto.location.longitude}":'
        ' I am at the following geographic coordinates:'
        ' latitude "${dto.location.latitude} '
        'longitude "${dto.location.longitude}".'
        ' This is happening: "${dto.message.content}". '
        "Don't write anything else besides the translated message.";
    final response = await _ai.generateContent(message);
    return response.text!;
  }

  @override
  Future<Either<SendMessageFailure, Unit>> sendEmergencyMessage(
    EmergencyMessage message,
  ) async {
    try {
      return right(unit);
    } catch (e) {
      return left(SendMessageNotSent(error: e.toString()));
    }
  }
}
