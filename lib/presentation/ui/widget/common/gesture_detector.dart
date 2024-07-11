import 'package:flutter/material.dart';

/// Wrap around [GestureDetector] with [Feedback]
class AppGestureDetector extends StatelessWidget {
  /// constructor
  const AppGestureDetector({
    required this.child,
    super.key,
    this.onTap,
  });

  /// on tap callback
  final VoidCallback? onTap;

  /// child
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Feedback.wrapForTap(onTap, context),
      child: child,
    );
  }
}
