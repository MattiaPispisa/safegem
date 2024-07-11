import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart' as c;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// connectivity states
enum Connectivity {
  /// connected
  connected,

  /// not connected
  notConnected;

  /// connected getter
  bool get isConnected => this == Connectivity.connected;

  /// not connected getter
  bool get isNotConnected => this == Connectivity.notConnected;
}

/// Listen the app connectivity and persist the last state.
///
/// last state can be retrieved using [ConnectivityHandler.of]
///
/// last state can be observed using [ValueListenableBuilder].
/// [LastKnowConnectivityBuilder] observe the last state and
/// expose a builder method
class ConnectivityHandler extends StatefulWidget {
  /// constructor
  const ConnectivityHandler({
    required this.child,
    super.key,
  });

  /// child
  final Widget child;

  /// retrieve [ConnectivityHandlerState]
  static ConnectivityHandlerState of(BuildContext context) {
    return context.findAncestorStateOfType<ConnectivityHandlerState>()!;
  }

  @override
  State<ConnectivityHandler> createState() => ConnectivityHandlerState();
}

/// state of [ConnectivityHandler]
///
/// use [ConnectivityHandlerState.lastKnownConnectivity]
/// to observe the last state
class ConnectivityHandlerState extends State<ConnectivityHandler> {
  StreamSubscription<List<c.ConnectivityResult>>? _connectivitySubscription;
  late ValueNotifier<Connectivity> _lastKnownConnectivity;

  /// last connectivity state
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

/// observe the last connectivity state of [ConnectivityHandler]
class LastKnowConnectivityBuilder extends StatelessWidget {
  /// constructor
  const LastKnowConnectivityBuilder({
    required this.builder,
    super.key,
  });

  /// build a widget using last connectivity
  final Widget Function(
    BuildContext context,
    Connectivity connectivity,
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
