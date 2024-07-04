import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safegem/application/application.dart';
import 'package:safegem/presentation/ui/extension/extension.dart';
import 'package:safegem/presentation/ui/view/settings/_color.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  void _setPrimaryColor(BuildContext context, AppColor color) {
    context.read<UserSettingsCubit>().setColor(color);
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme();
    return BlocBuilder<UserSettingsCubit, UserSettingsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: theme.iconTheme.copyWith(
              color: theme.app.colors.neutral.shade900,
            ),
            forceMaterialTransparency: true,
          ),
          body: Padding(
            padding: EdgeInsets.all(theme.app.spacing.l),
            child: Column(
              children: [
                Wrap(
                  direction: Axis.horizontal,
                  spacing: theme.app.spacing.l,
                  children: state.availableColors.map((color) {
                    return SelectableColor(
                      color: state.colorOf(color),
                      selected: color == state.selectedColor,
                      onTap: () => _setPrimaryColor(context, color),
                    );
                  }).toList(),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
