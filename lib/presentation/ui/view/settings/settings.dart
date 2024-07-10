import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safegem/application/application.dart';
import 'package:safegem/domain/domain.dart';
import 'package:safegem/presentation/ui/extension/extension.dart';
import 'package:safegem/presentation/ui/view/settings/_color.dart';

import '_emergency_contact_dialog.dart';
import '_skeleton.dart';

/// settings view
class SettingsView extends StatelessWidget {
  /// constructor
  const SettingsView({super.key});

  void _setPrimaryColor(BuildContext context, AppColor color) {
    context.read<UserSettingsCubit>().setColor(color);
  }

  void _toggleDarkMode(BuildContext context) {
    context.read<UserSettingsCubit>().toggleDarkMode();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme();

    return BlocBuilder<UserSettingsCubit, UserSettingsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(context.t().settings),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: theme.app.spacing.horizontal,
              vertical: theme.app.spacing.l,
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: SettingsSkeleton(
                sections: [
                  SettingsSection(
                    title: context.t().theme,
                    content: _color(context, state: state),
                  ),
                  SettingsSection(
                    title: context.t().brightness,
                    content: _brightness(context, state: state),
                  ),
                  SettingsSection(
                    title: context.t().emergencyContacts,
                    headerTrailing: IconButton(
                      padding: EdgeInsets.zero,
                      visualDensity: VisualDensity.compact,
                      icon: Icon(
                        Icons.add,
                        color: theme.appBarTheme.iconTheme?.color,
                      ),
                      onPressed: () {
                        showEmergencyContactDialog(context,
                            emergencyContact: null);
                      },
                    ),
                    content: _emergencyContacts(
                      context,
                      emergencyContacts: state.emergencyContacts,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _color(
    BuildContext context, {
    required UserSettingsState state,
  }) {
    final theme = context.theme();

    return Wrap(
      spacing: theme.app.spacing.l,
      children: state.availableColors.map((color) {
        return SelectableColor(
          color: state.colorOf(color),
          selected: color == state.selectedColor,
          onTap: () => _setPrimaryColor(context, color),
        );
      }).toList(),
    );
  }

  Widget _brightness(
    BuildContext context, {
    required UserSettingsState state,
  }) {
    return Row(
      children: [
        Text(state.darkMode ? context.t().dark : context.t().light),
        Switch(
          value: state.darkMode,
          onChanged: (_) => _toggleDarkMode(context),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        )
      ],
    );
  }

  Widget _emergencyContacts(
    BuildContext context, {
    required List<EmergencyContact> emergencyContacts,
  }) {
    return ListView.builder(
      itemCount: emergencyContacts.length,
      itemBuilder: (context, index) {
        final contact = emergencyContacts[index];
        return Text(contact.displayName);
      },
      shrinkWrap: true,
    );
  }
}
