import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safegem/application/user_settings/user_settings_cubit.dart';
import 'package:safegem/presentation/ui/theme/app_theme.dart';

class UserTheme extends StatelessWidget {
  const UserTheme({
    super.key,
    required this.builder,
  });

  final Widget Function(BuildContext context, ThemeData theme) builder;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<UserSettingsCubit, UserSettingsState, ThemeData>(
      selector: (state) {
        final iconTheme = IconThemeData(
          size: 20,
        );
        if (state.darkMode) {
          return ThemeData.dark(useMaterial3: false).copyWith(
            iconTheme: iconTheme,
            primaryColor: state.materialColor,
            extensions: [
              AppTheme.dark(),
            ],
          );
        }
        return ThemeData.light(useMaterial3: false).copyWith(
          iconTheme: iconTheme,
          primaryColor: state.materialColor,
          extensions: [
            AppTheme.light(),
          ],
        );
      },
      builder: builder,
    );
  }
}
