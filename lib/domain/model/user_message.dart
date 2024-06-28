import 'package:equatable/equatable.dart';

class UserMessage extends Equatable {
  const UserMessage({
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => [message];
}
