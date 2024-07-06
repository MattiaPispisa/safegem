import 'package:flutter/material.dart';
import 'package:safegem/presentation/ui/extension/extension.dart';

class ChipButton extends StatelessWidget {
  const ChipButton(
      {super.key,
      required this.iconData,
      this.iconColor,
      required this.text,
      this.onPressed});

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
      padding: EdgeInsets.all(0),
      labelPadding: EdgeInsets.symmetric(
        horizontal: theme.spacing.m,
        vertical: 0,
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
          SizedBox(width: 8),
          Text(text),
        ],
      ),
      onPressed: onPressed,
    );
  }
}
