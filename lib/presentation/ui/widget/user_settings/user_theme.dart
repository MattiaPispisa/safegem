import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safegem/application/user_settings/user_settings_cubit.dart';
import 'package:safegem/presentation/ui/theme/app_theme.dart';

/// From [UserSettingsState] compute the app [ThemeData]
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
        if (state.darkMode) {
          return _darkTheme(state);
        }
        return _lightTheme(state);
      },
      builder: builder,
    );
  }

  ThemeData _lightTheme(UserSettingsState state) {
    return _custom(
      ThemeData.light(useMaterial3: false),
      AppTheme.light(),
      state,
    );
  }

  ThemeData _darkTheme(UserSettingsState state) {
    return _custom(
      ThemeData.dark(useMaterial3: false),
      AppTheme.dark(),
      state,
    );
  }

  ThemeData _custom(
    ThemeData theme,
    AppTheme appTheme,
    UserSettingsState state,
  ) {
    final iconTheme = IconThemeData(
      size: 20,
    );
    final textTheme = theme.textTheme.copyWith(
      titleMedium: theme.textTheme.titleLarge?.copyWith(
        fontSize: 20,
      ),
      titleSmall: theme.textTheme.titleLarge?.copyWith(
        fontSize: 18,
      ),
    );

    return theme.copyWith(
      scaffoldBackgroundColor: appTheme.colors.neutral.shade50,
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        iconTheme: theme.iconTheme.copyWith(
          color: appTheme.colors.neutral.shade900,
        ),
        titleTextStyle: textTheme.titleMedium,
        backgroundColor: appTheme.colors.neutral.shade50,
        elevation: 0,
      ),
      iconTheme: iconTheme,
      primaryColor: state.materialColor,
      extensions: [
        appTheme,
      ],
    );
  }
}
