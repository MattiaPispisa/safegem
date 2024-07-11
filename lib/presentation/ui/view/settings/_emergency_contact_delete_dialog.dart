import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:safegem/application/application.dart';
import 'package:safegem/domain/model/emergency_contact.dart';
import 'package:safegem/presentation/ui/extension/extension.dart';
import 'package:safegem/presentation/ui/widget/widget.dart';

/// show a bottom sheet that handle the [contact] deletion.
Future<void> showEmergencyContactDeleteDialog(
  BuildContext context, {
  required EmergencyContact contact,
}) {
  return AppBottomSheet.show(
    context,
    title: context.t().delete,
    builder: (_) {
      return _DeleteDialogContent(
        contact: contact,
        key: const ValueKey('delete_dialog_content'),
      );
    },
  );
}

class _DeleteDialogContent extends StatelessWidget {
  const _DeleteDialogContent({
    required this.contact,
    super.key,
  });

  final EmergencyContact contact;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme();
    final appTheme = theme.app;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          context.t().sureRemoveContact(contact.displayName),
        ),
        SizedBox(height: appTheme.spacing.beforeAction),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
          onPressed: () {
            context.read<UserSettingsCubit>().removeEmergencyContact(contact);
            context.pop();
          },
          child: Text(context.t().delete),
        ),
      ],
    );
  }
}
