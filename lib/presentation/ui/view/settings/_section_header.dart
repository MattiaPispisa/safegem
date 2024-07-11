import 'package:flutter/material.dart';
import 'package:safegem/presentation/ui/extension/extension.dart';
import 'package:safegem/presentation/ui/view/settings/_skeleton.dart';

/// header of a [SettingsSection] applied on [SettingsSkeleton]
class SettingsSectionHeader extends StatelessWidget {
  /// constructor
  const SettingsSectionHeader({
    required this.text,
    super.key,
    this.trailing,
  });

  /// title
  final String text;

  /// optional widget after [text]
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
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
