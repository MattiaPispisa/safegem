import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safegem/application/application.dart';
import 'package:safegem/domain/domain.dart';
import 'package:safegem/presentation/ui/extension/extension.dart';
import 'package:safegem/presentation/ui/view/settings/_color.dart';
import 'package:safegem/presentation/ui/view/settings/_emergency_contact_card.dart';
import 'package:safegem/presentation/ui/view/settings/_emergency_contact_delete_dialog.dart';
import 'package:safegem/presentation/ui/view/settings/_emergency_contact_dialog.dart';
import 'package:safegem/presentation/ui/view/settings/_skeleton.dart';

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

  void _onPressedAddContact(BuildContext context) {
    showEmergencyContactDialog(
      context,
      emergencyContact: null,
      onDone: (emergencyContact) => context
          .read<UserSettingsCubit>()
          .handleEmergencyContact(emergencyContact),
    );
  }

  void _onPressedEditContact(
    BuildContext context, {
    required EmergencyContact contact,
  }) {
    showEmergencyContactDialog(
      context,
      emergencyContact: contact,
      onDone: (emergencyContact) => context
          .read<UserSettingsCubit>()
          .handleEmergencyContact(emergencyContact),
    );
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
                      onPressed: () => _onPressedAddContact(context),
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
        ),
      ],
    );
  }

  Widget _emergencyContacts(
    BuildContext context, {
    required List<EmergencyContact> emergencyContacts,
  }) {
    final theme = context.theme();
    return ListView.separated(
      itemCount: emergencyContacts.length,
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) {
        return SizedBox(height: theme.app.spacing.between);
      },
      itemBuilder: (context, index) {
        final contact = emergencyContacts[index];
        return EmergencyContactCard(
          contact: contact,
          onTap: () => _onPressedEditContact(context, contact: contact),
          onTapDelete: () =>
              showEmergencyContactDeleteDialog(context, contact: contact),
        );
      },
      shrinkWrap: true,
    );
  }
}
