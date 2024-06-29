import 'package:equatable/equatable.dart';

class SenderContactInfo extends Equatable {
  const SenderContactInfo({
    required this.userName,
    required this.sureName,
    required this.phoneNumber,
  });

  final String? userName;
  final String? sureName;
  final String? phoneNumber;

  @override
  List<Object?> get props => [
        userName,
        sureName,
        phoneNumber,
      ];
}
