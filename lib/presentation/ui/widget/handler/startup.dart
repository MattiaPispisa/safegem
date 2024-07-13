import 'package:flutter/material.dart';
import 'package:safegem/presentation/ui/widget/handler/handler.dart';

/// Widget to setup on top of app
///
/// Contains:
/// - [ConnectivityHandler]
/// - [LocationHandler]
class Startup extends StatelessWidget {
  /// constructor
  const Startup({
    required this.child,
    super.key,
  });

  /// child
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ConnectivityHandler(
      child: LocationHandler(
        child: child,
      ),
    );
  }
}
