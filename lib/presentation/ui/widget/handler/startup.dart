import 'package:flutter/material.dart';
import 'package:safegem/presentation/ui/widget/handler/connectivity_handler.dart';
import 'handler.dart';

class Startup extends StatelessWidget {
  const Startup({
    super.key,
    required this.child,
  });

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
