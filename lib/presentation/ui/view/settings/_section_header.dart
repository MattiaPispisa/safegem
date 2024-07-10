import 'package:flutter/material.dart';
import 'package:safegem/presentation/ui/extension/extension.dart';

class SettingsSectionHeader extends StatelessWidget {
  const SettingsSectionHeader({
    required this.text,
    super.key,
    this.trailing,
  });

  final String text;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme();

    if (trailing == null) {
      return _text(theme);
    }

    return Row(
      children: [
        Expanded(
          child: _text(theme),
        ),
        trailing!,
      ],
    );
  }

  Widget _text(ThemeData theme) {
    return Text(
      text,
      style: theme.textTheme.headlineSmall,
    );
  }
}
