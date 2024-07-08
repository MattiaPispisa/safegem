import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart' as c;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum Connectivity {
  connected,
  notConnected;

  bool get isConnected => this == Connectivity.connected;
  bool get isNotConnected => this == Connectivity.notConnected;
}

class ConnectivityHandler extends StatefulWidget {
  const ConnectivityHandler({
    required this.child, super.key,
  });

  final Widget child;

  static ConnectivityHandlerState of(BuildContext context) {
    return context.findAncestorStateOfType<ConnectivityHandlerState>()!;
  }

  @override
  State<ConnectivityHandler> createState() => ConnectivityHandlerState();
}

class ConnectivityHandlerState extends State<ConnectivityHandler> {
  StreamSubscription<List<c.ConnectivityResult>>? _connectivitySubscription;
  late ValueNotifier<Connectivity> _lastKnownConnectivity;

  ValueListenable<Connectivity> get lastKnownConnectivity =>
      _lastKnownConnectivity;

  @override
  void initState() {
    _lastKnownConnectivity = ValueNotifier(Connectivity.connected);
    super.initState();
    _collectionConnectivity();
  }

  bool _isConnected(List<c.ConnectivityResult> result) {
    final connectedStatuses = <c.ConnectivityResult>[
      c.ConnectivityResult.wifi,
      c.ConnectivityResult.ethernet,
      c.ConnectivityResult.mobile,
    ];

    return connectedStatuses.any((status) => result.contains(status));
  }

  void _set(Connectivity connectivity) {
    if (connectivity == _lastKnownConnectivity.value) {
      return;
    }
    _lastKnownConnectivity.value = connectivity;
  }

  void _collectionConnectivity() {
    _connectivitySubscription = c.Connectivity().onConnectivityChanged.listen(
      (List<c.ConnectivityResult> result) {
        if (_isConnected(result)) {
          return _set(Connectivity.connected);
        }
        return _set(Connectivity.notConnected);
      },
    );
  }

  @override
  void dispose() {
    _connectivitySubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

class LastKnowConnectivityBuilder extends StatelessWidget {
  const LastKnowConnectivityBuilder({
    required this.builder, super.key,
  });

  final Widget Function(
    BuildContext context,
    Connectivity location,
  ) builder;

  @override
  Widget build(BuildContext context) {
    final location = ConnectivityHandler.of(context).lastKnownConnectivity;

    return ValueListenableBuilder(
      valueListenable: location,
      builder: (context, value, child) {
        return builder(context, value);
      },
    );
  }
}
