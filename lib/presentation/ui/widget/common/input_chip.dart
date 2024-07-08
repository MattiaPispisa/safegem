import 'package:flutter/material.dart';
import 'package:safegem/presentation/ui/extension/extension.dart';

class ChipButton extends StatelessWidget {
  const ChipButton(
      {required this.iconData, required this.text, super.key,
      this.iconColor,
      this.onPressed,});

  final IconData iconData;
  final Color? iconColor;
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme();
    return InputChip(
      elevation: 0,
      pressElevation: 0,
      padding: const EdgeInsets.all(0),
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
