import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safegem/application/application.dart';
import 'package:safegem/presentation/ui/extension/extension.dart';
import 'package:safegem/presentation/ui/view/settings/_color.dart';

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
    final space = SizedBox(
      height: context.appTheme().spacing.between,
    );
    return BlocBuilder<UserSettingsCubit, UserSettingsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(context.t().settings),
          ),
          body: Padding(
            padding: EdgeInsets.all(theme.app.spacing.l),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sectionTitle(context, text: context.t().theme),
                  space,
                  _color(context, state: state),
                  space,
                  space,
                  _sectionTitle(context, text: context.t().brightness),
                  space,
                  _brightness(context, state: state),
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

  Widget _sectionTitle(
    BuildContext context, {
    required String text,
  }) {
    final theme = context.theme();

    return Text(
      text,
      style: theme.textTheme.headlineSmall,
    );
  }
}
