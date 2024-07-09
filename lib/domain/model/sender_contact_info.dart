import 'package:equatable/equatable.dart';

/// Basic information of the person sending a message.
class SenderContactInfo extends Equatable {
  /// constructor
  const SenderContactInfo({
    required this.userName,
    required this.sureName,
    required this.phoneNumber,
  });

  /// sender name
  final String? userName;

  /// sender sureName
  final String? sureName;

  /// sender number
  final String? phoneNumber;

  @override
  List<Object?> get props => [
        userName,
        sureName,
        phoneNumber,
      ];
}
