import 'package:dartz/dartz.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:injectable/injectable.dart';
import 'package:safegem/domain/model/uri.dart';
import 'package:safegem/domain/domain.dart';

import 'ai_module.dart';

// phone reg exp inside text
final RegExp phoneRegExp = RegExp(r'\+?\d[\d-. ]*(?:\d)');

@LazySingleton(as: EmergencyService)
class ImplEmergencyService extends EmergencyService {
  const ImplEmergencyService(this._ai);

  final AI _ai;

  @override
  Future<Either<EmergencyMessageFailure, EmergencyMessage>> getEmergencyMessage(
    GetEmergencyMessageDto dto,
  ) async {
    String? number;
    String? localizedMessage;

    try {
      localizedMessage = await _localizedMessage(dto);
    } catch (e) {
      localizedMessage = null;
    }

    try {
      number = await _mostAppropriatedNumber(dto);
    } catch (e) {
      number = null;
    }

    if (number == null) {
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
        authorityNumber: number,
        message: localizedMessage,
        sms: UriHelper.sms(
          message: localizedMessage,
          number: number,
        ),
        phone: UriHelper.phone(
          number: number,
        ),
      ),
    );
  }

  Future<String> _mostAppropriatedNumber(
    GetEmergencyMessageDto dto,
  ) async {
    final message = 'I am at the following geographic coordinates: '
        'latitude "${dto.location.latitude}" longitude "${dto.location.longitude}". '
        'This is happening: "${dto.message.message}". '
        'Give me the phone number of the most appropriate authority '
        'in the following format: authority name: number.';
    final content = [Content.text(message)];
    final response = await _ai.generateContent(content);
    final match = phoneRegExp.firstMatch(response.text!);
    return match![0]!;
  }

  Future<String> _localizedMessage(
    GetEmergencyMessageDto dto,
  ) async {
    final message =
        'Translate in your own words: I am at the following geographic coordinates:'
        'latitude "${dto.location.latitude}" longitude "${dto.location.longitude}".'
        'This is happening: "${dto.message.message}".';
    final content = [Content.text(message)];
    final response = await _ai.generateContent(content);
    return response.text!;
  }

  @override
  Future<Either<SendMessageFailure, Unit>> sendEmergencyMessage(
    EmergencyMessage message,
  ) async {
    try {
      /* await Telephony.instance.sendSms(
        to: message.authorityNumber,
        message: message.message,
      ); */
      return right(unit);
    } catch (e) {
      return left(SendMessageNotSent(error: e.toString()));
    }
  }
}
