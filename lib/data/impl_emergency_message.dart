import 'package:dartz/dartz.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:injectable/injectable.dart';
import 'package:safegem/domain/emergency_service.dart';
import 'package:safegem/domain/model/emergency_message.dart';

final RegExp phoneRegExp =
    RegExp(r'^(\+?\d{1,4}[\s-]?)?(\(?\d{3}\)?[\s-]?)?[\d\s-]{7,10}$');

@LazySingleton(as: EmergencyMessage)
class ImplEmergencyService extends EmergencyService {
  const ImplEmergencyService(this._model);
  
  final GenerativeModel _model;

  @override
  Future<Either<bool, EmergencyMessage>> getEmergencyMessage() {
    // TODO: implement getEmergencyMessage
    throw UnimplementedError();
  }

  @override
  Future<Either<bool, Unit>> sendEmergencyMessage() {
    // TODO: implement sendEmergencyMessage
    throw UnimplementedError();
  }
}
