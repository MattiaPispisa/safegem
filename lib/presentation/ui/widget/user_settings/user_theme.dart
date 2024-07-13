import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safegem/application/user_settings/user_settings_cubit.dart';
import 'package:safegem/presentation/ui/theme/app_theme.dart';

/// From [UserSettingsState] compute the app [ThemeData]
class UserTheme extends StatelessWidget {
  /// constructor
  const UserTheme({
    required this.builder,
    super.key,
  });

  /// builder with computed [ThemeData]
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
    final primaryColor = state.materialColor;

    const iconTheme = IconThemeData(
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
    final inputBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: primaryColor,
      ),
    );
    final errorBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: appTheme.colors.warning,
      ),
    );
    final inputDecorationTheme = theme.inputDecorationTheme.copyWith(
      suffixIconColor: primaryColor,
      prefixIconColor: primaryColor,
      iconColor: primaryColor,
      border: inputBorder,
      hoverColor: primaryColor,
      fillColor: primaryColor,
      focusColor: primaryColor,
      focusedBorder: inputBorder,
      enabledBorder: inputBorder,
      focusedErrorBorder: errorBorder,
      errorBorder: errorBorder,
      errorStyle: TextStyle(color: appTheme.colors.warning),
    );

    return theme.copyWith(
      scaffoldBackgroundColor: appTheme.colors.neutral.shade50,
      textTheme: textTheme,
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: primaryColor,
        cursorColor: primaryColor,
        selectionHandleColor: primaryColor,
      ),
      inputDecorationTheme: inputDecorationTheme,
      appBarTheme: AppBarTheme(
        iconTheme: theme.iconTheme.copyWith(
          color: appTheme.colors.neutral.shade900,
        ),
        titleTextStyle: textTheme.titleMedium,
        backgroundColor: appTheme.colors.neutral.shade50,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: primaryColor,
        ),
      ),
      iconTheme: iconTheme,
      primaryColor: primaryColor,
      extensions: [
        appTheme,
      ],
    );
  }
}
