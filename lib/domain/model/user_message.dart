import 'package:equatable/equatable.dart';

/// An user message
class UserMessage extends Equatable {
  /// constructor
  const UserMessage({
    required this.content,
  });

  /// user message content
  final String content;

  @override
  List<Object?> get props => [content];
}
