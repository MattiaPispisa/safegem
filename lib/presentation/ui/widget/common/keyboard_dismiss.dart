import 'package:flutter/material.dart';

/// on tap [child] keyboard is dismissed
class KeyboardDismiss extends StatelessWidget {
  /// constructor
  const KeyboardDismiss({
    required this.child,
    super.key,
  });

  /// child
  final Widget child;

  void _closeKeyboard(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _closeKeyboard(context),
      child: child,
    );
  }
}
