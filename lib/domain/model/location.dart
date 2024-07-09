import 'package:equatable/equatable.dart';

/// Represents the user's location in the world.
class Location extends Equatable {
  /// constructor
  const Location({
    required this.latitude,
    required this.longitude,
  });

  /// latitude
  final double latitude;

  /// longitude
  final double longitude;

  @override
  List<Object?> get props => [
        latitude,
        longitude,
      ];
}
