import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:safegem/presentation/ui/extension/extension.dart';

@immutable
class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  void _goSettings(BuildContext context) {
    context.go('/settings');
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme().app;
    return AppBar(
      forceMaterialTransparency: true,
      actions: [
        IconButton(
          onPressed: () => _goSettings(context),
          icon: FaIcon(
            FontAwesomeIcons.gear,
            color: theme.colors.neutral.shade900,
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
