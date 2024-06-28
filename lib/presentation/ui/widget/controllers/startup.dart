import 'package:flutter/material.dart';
import 'package:safegem/presentation/ui/widget/controllers/location_permission.dart';

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
