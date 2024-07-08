import 'package:flutter/material.dart';
import 'package:safegem/presentation/ui/extension/extension.dart';

/// Create a widget to display alerts and error messages.
class Alert extends StatelessWidget {
  const Alert({
    required this.child, super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: appTheme.colors.warning,
      ),
      child: Padding(
        padding:  EdgeInsets.all(appTheme.spacing.m),
        child: child,
      ),
    );
  }
}
