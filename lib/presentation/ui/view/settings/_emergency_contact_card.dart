import 'package:flutter/material.dart';
import 'package:safegem/domain/domain.dart';
import 'package:safegem/presentation/ui/extension/extension.dart';

/// Card that display [contact] information
class EmergencyContactCard extends StatelessWidget {
  /// constructor
  const EmergencyContactCard({
    required this.contact,
    required this.onTap,
    required this.onTapDelete,
    super.key,
  });

  /// emergencyContact
  final EmergencyContact contact;

  /// on tap card
  final VoidCallback onTap;

  /// on tap delete icon
  final VoidCallback onTapDelete;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme();
    final appTheme = theme.app;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(appTheme.spacing.m),
      child: Ink(
        decoration: BoxDecoration(
          color: appTheme.colors.neutral.shade100,
          borderRadius: BorderRadius.circular(appTheme.spacing.m),
        ),
        child: Padding(
          padding: EdgeInsets.all(appTheme.spacing.l),
          child: Row(
            children: [
              Expanded(child: _info(context)),
              SizedBox(height: appTheme.spacing.m),
              _deleteButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _info(BuildContext context) {
    final theme = context.theme();
    final appTheme = theme.app;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          contact.displayName,
          style: theme.textTheme.titleLarge,
          maxLines: 1,
        ),
        SizedBox(height: appTheme.spacing.s),
        Text(
          contact.number,
          style: theme.textTheme.bodyLarge,
          maxLines: 1,
        ),
      ],
    );
  }

  Widget _deleteButton(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
      icon: const Icon(
        Icons.delete,
        color: Colors.red,
      ),
      onPressed: onTapDelete,
    );
  }
}
