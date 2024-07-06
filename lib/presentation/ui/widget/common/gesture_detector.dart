import 'package:flutter/material.dart';

class AppGestureDetector extends StatelessWidget {
  const AppGestureDetector({
    super.key,
    this.onTap,
    required this.child,
  });

  final VoidCallback? onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Feedback.wrapForTap(onTap, context),
      child: child,
    );
  }
}
