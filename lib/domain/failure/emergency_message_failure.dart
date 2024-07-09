import 'package:equatable/equatable.dart';

/// Base class for possible failures due to composing an emergency message
sealed class EmergencyMessageFailure extends Equatable {
  /// constructor
  const EmergencyMessageFailure();

  /// map to handle every [EmergencyMessageFailure] failures
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
      case final EmergencyMessageUnsupportedUserLocation
        unsupportedUserLocation:
        return onUnsupportedUserLocation(unsupportedUserLocation);
    }
  }
}

/// Failure occurring when the service is not available
/// in the current user location
final class EmergencyMessageUnsupportedUserLocation
    extends EmergencyMessageFailure {
  /// constructor
  const EmergencyMessageUnsupportedUserLocation(this.message);

  /// technical error
  final String? message;

  @override
  List<Object?> get props => [message];
}

/// Failure occurring when it's impossible to find
/// a phone number for the authorities
final class EmergencyMessageAuthorityNumberNotFound
    extends EmergencyMessageFailure {
  /// constructor
  const EmergencyMessageAuthorityNumberNotFound({
    required this.message,
  });

  /// recognized user message
  final String? message;

  @override
  List<Object?> get props => [message];
}

/// Failure occurring when it's impossible to recognize
/// the user message
final class EmergencyMessageNotRecognized extends EmergencyMessageFailure {
  /// constructor
  const EmergencyMessageNotRecognized({
    required this.authorityNumber,
  });

  /// recognized authority number
  final String? authorityNumber;

  @override
  List<Object?> get props => [authorityNumber];
}
