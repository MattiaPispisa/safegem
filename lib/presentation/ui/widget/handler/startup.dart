import 'package:flutter/material.dart';
import 'handler.dart';

class Startup extends StatelessWidget {
  const Startup({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LocationHandler(
      child: child,
    );
  }
}
