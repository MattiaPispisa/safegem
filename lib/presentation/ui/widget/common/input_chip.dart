import 'package:flutter/material.dart';
import 'package:safegem/presentation/ui/extension/extension.dart';

/// A little rounder button with an [iconData] and [text]
class ChipButton extends StatelessWidget {
  /// constructor
  const ChipButton({
    required this.iconData,
    required this.text,
    super.key,
    this.iconColor,
    this.onPressed,
  });

  /// iconData displayed before [text]
  final IconData iconData;

  /// [iconData] color
  final Color? iconColor;

  /// button text
  final String text;

  /// callback on tap chip button
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme();
    return InputChip(
      elevation: 0,
      pressElevation: 0,
      padding: EdgeInsets.zero,
      labelPadding: EdgeInsets.symmetric(
        horizontal: theme.spacing.m,
      ),
      visualDensity: VisualDensity.compact,
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            size: 12,
            color: iconColor,
          ),
          const SizedBox(width: 8),
          Text(text),
        ],
      ),
      onPressed: onPressed,
    );
  }
}
