import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart' as g;
import 'package:safegem/domain/model/model.dart';

class LocationHandler extends StatefulWidget {
  const LocationHandler({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<LocationHandler> createState() => _LocationHandlerState();
}

class _LocationHandlerState extends State<LocationHandler> {
  var _permissionGranted = false;
  StreamSubscription<Location>? _positionSubscription;
  Location? _lastKnownLocation;

  @override
  void initState() {
    super.initState();
    _checkPermission();
  }

  void _checkPermission() async {
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

  void _collectionLocation() {
    final platform = Theme.of(context).platform;
    late g.LocationSettings locationSettings;

    if (platform == TargetPlatform.android) {
      locationSettings = g.AndroidSettings(
        accuracy: g.LocationAccuracy.high,
        distanceFilter: 100,
        forceLocationManager: true,
        intervalDuration: const Duration(seconds: 10),
      );
    } else if (platform == TargetPlatform.iOS ||
        platform == TargetPlatform.macOS) {
      locationSettings = g.AppleSettings(
        accuracy: g.LocationAccuracy.high,
        activityType: g.ActivityType.fitness,
        distanceFilter: 100,
        pauseLocationUpdatesAutomatically: true,
        showBackgroundLocationIndicator: false,
      );
    } else {
      locationSettings = g.LocationSettings(
        accuracy: g.LocationAccuracy.high,
        distanceFilter: 100,
      );
    }
    _positionSubscription?.cancel();
    _positionSubscription =
        g.Geolocator.getPositionStream(locationSettings: locationSettings).map(
      (position) {
        return Location(
          latitude: position.latitude,
          longitude: position.longitude,
        );
      },
    ).listen((location) => _lastKnownLocation = location);
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
