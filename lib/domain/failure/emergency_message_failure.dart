import 'package:equatable/equatable.dart';

sealed class EmergencyMessageFailure extends Equatable {
  const EmergencyMessageFailure();

  T map<T>({
    required T Function(EmergencyMessageAuthorityNumberNotFound)
        onNumberNotFound,
    required T Function(EmergencyMessageNotRecognized) onNotRecognized,
    required T Function(EmergencyMessageUnsupportedUserLocation)
        onUnsupportedUserLocation,
  }) {
    switch (this) {
      case final EmergencyMessageAuthorityNumberNotFound notFound:
        return onNumberNotFound(notFound);
      case final EmergencyMessageNotRecognized notRecognized:
        return onNotRecognized(notRecognized);
      case final EmergencyMessageUnsupportedUserLocation unsupportedUserLocation:
        return onUnsupportedUserLocation(unsupportedUserLocation);
    }
  }
}

final class EmergencyMessageUnsupportedUserLocation
    extends EmergencyMessageFailure {
  const EmergencyMessageUnsupportedUserLocation(this.message);

  final String? message;

  @override
  List<Object?> get props => [message];
}

final class EmergencyMessageAuthorityNumberNotFound
    extends EmergencyMessageFailure {
  const EmergencyMessageAuthorityNumberNotFound({
    required this.message,
  });

  final String? message;

  @override
  List<Object?> get props => [message];
}

final class EmergencyMessageNotRecognized extends EmergencyMessageFailure {
  const EmergencyMessageNotRecognized({
    required this.authorityNumber,
  });

  final String? authorityNumber;

  @override
  List<Object?> get props => [authorityNumber];
}
