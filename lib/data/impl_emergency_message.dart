import 'package:dartz/dartz.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:injectable/injectable.dart';
import 'package:safegem/domain/domain.dart';

final RegExp phoneRegExp =
    RegExp(r'^(\+?\d{1,4}[\s-]?)?(\(?\d{3}\)?[\s-]?)?[\d\s-]{7,10}$');

@LazySingleton(as: EmergencyService)
class ImplEmergencyService extends EmergencyService {
  const ImplEmergencyService(this._model);

  final GenerativeModel _model;

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
      EmergencyMessage(authorityNumber: number, message: localizedMessage),
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
    final response = await _model.generateContent(content);
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
    final response = await _model.generateContent(content);
    return response.text!;
  }

  @override
  Future<Either<SendMessageFailure, Unit>> sendEmergencyMessage(
      EmergencyMessage message) {
    // TODO: implement sendEmergencyMessage
    throw UnimplementedError();
  }
}
