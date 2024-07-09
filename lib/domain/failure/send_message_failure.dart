import 'package:equatable/equatable.dart';

/// A base class for possible failures when sending a message
sealed class SendMessageFailure extends Equatable {
  const SendMessageFailure();

  /// map to handle every [SendMessageFailure] failures
  T map<T>({
    required T Function(SendMessageNotSent notSent) onNotSent,
  }) {
    switch (this) {
      case final SendMessageNotSent notSent:
        return onNotSent(notSent);
    }
  }
}

/// Failure occurring when the message is not sent
final class SendMessageNotSent extends SendMessageFailure {
  /// constructor
  const SendMessageNotSent({
    required this.error,
  });

  /// technical error
  final String error;

  @override
  List<Object?> get props => [error];
}
