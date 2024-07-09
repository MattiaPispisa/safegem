import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

/// Home app bar. Contains an [IconButton] to go settings
@immutable
class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// constructor
  const HomeAppBar({super.key});

  void _goSettings(BuildContext context) {
    context.go('/settings');
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      actions: [
        IconButton(
          onPressed: () => _goSettings(context),
          icon: const FaIcon(
            FontAwesomeIcons.gear,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
