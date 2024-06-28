import 'package:equatable/equatable.dart';

sealed class SendMessageFailure extends Equatable {
  const SendMessageFailure();

  T map<T>({
    required T Function(SendMessageNotSent notSent) onNotSent,
  }) {
    switch (this) {
      case SendMessageNotSent notSent:
        return onNotSent(notSent);
    }
  }
}

final class SendMessageNotSent extends SendMessageFailure {
  const SendMessageNotSent({
    required this.error,
  });

  final String error;

  @override
  List<Object?> get props => [error];
}
