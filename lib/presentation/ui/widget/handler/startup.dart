import 'package:flutter/material.dart';
import 'package:safegem/presentation/ui/widget/handler/handler.dart';

class Startup extends StatelessWidget {
  const Startup({
    required this.child, super.key,
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
