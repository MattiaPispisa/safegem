import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart' as g;
import 'package:safegem/domain/model/model.dart';

/// Listen the app location and persist the last state.
///
/// last state can be retrieved using [LocationHandler.of]
///
/// last state can be observed using [ValueListenableBuilder].
/// [LastKnowLocationBuilder] observe the last state and
/// expose a builder method
class LocationHandler extends StatefulWidget {
  /// constructor
  const LocationHandler({
    required this.child,
    super.key,
  });

  /// child
  final Widget child;

  /// retrieve [LocationHandlerState]
  static LocationHandlerState of(BuildContext context) {
    return context.findAncestorStateOfType<LocationHandlerState>()!;
  }

  @override
  State<LocationHandler> createState() => LocationHandlerState();
}

/// state of [LocationHandler]
///
/// use [LocationHandlerState.lastKnowLocation]
/// to observe the last state
class LocationHandlerState extends State<LocationHandler> {
  var _permissionGranted = false;
  StreamSubscription<Location>? _positionSubscription;
  late ValueNotifier<Location?> _lastKnownLocation;

  /// last location state
  ValueListenable<Location?> get lastKnowLocation => _lastKnownLocation;

  @override
  void initState() {
    _lastKnownLocation = ValueNotifier(null);
    super.initState();
    _checkPermission().then((_) => _collectionLocation());
  }

  Future<void> _checkPermission() async {
    var permission = await g.Geolocator.checkPermission();

    if (permission == g.LocationPermission.denied) {
      permission = await g.Geolocator.requestPermission();
    }

    if (permission == g.LocationPermission.whileInUse ||
        permission == g.LocationPermission.always) {
      _permissionGranted = true;
    } else {
      _permissionGranted = false;
    }

    return;
  }

  g.LocationSettings _locationSettings() {
    final platform = Theme.of(context).platform;

    if (platform == TargetPlatform.android) {
      return g.AndroidSettings(
        accuracy: g.LocationAccuracy.high,
        distanceFilter: 100,
        forceLocationManager: true,
        intervalDuration: const Duration(seconds: 10),
      );
    } else if (platform == TargetPlatform.iOS ||
        platform == TargetPlatform.macOS) {
      return g.AppleSettings(
        accuracy: g.LocationAccuracy.high,
        activityType: g.ActivityType.fitness,
        distanceFilter: 100,
        pauseLocationUpdatesAutomatically: true,
      );
    }

    return const g.LocationSettings(
      accuracy: g.LocationAccuracy.high,
      distanceFilter: 100,
    );
  }

  Location _positionMap(g.Position position) {
    return Location(
      latitude: position.latitude,
      longitude: position.longitude,
    );
  }

  void _collectionLocation() {
    if (!_permissionGranted) {
      return;
    }

    final settings = _locationSettings();

    _positionSubscription?.cancel();
    _positionSubscription =
        g.Geolocator.getPositionStream(locationSettings: settings)
            .map(_positionMap)
            .listen((location) => _lastKnownLocation.value = location);
  }

  @override
  void dispose() {
    _positionSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

/// observe the last connectivity state of [LocationHandler]
class LastKnowLocationBuilder extends StatelessWidget {
  /// constructor
  const LastKnowLocationBuilder({
    required this.builder,
    super.key,
  });

    /// build a widget using last location
  final Widget Function(
    BuildContext context,
    Location? location,
  ) builder;

  @override
  Widget build(BuildContext context) {
    final location = LocationHandler.of(context).lastKnowLocation;

    return ValueListenableBuilder(
      valueListenable: location,
      builder: (context, value, child) {
        return builder(context, value);
      },
    );
  }
}
