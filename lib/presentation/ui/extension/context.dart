import 'package:flutter/material.dart';
import 'package:safegem/l10n/app_localizations.dart';
import 'package:safegem/presentation/ui/theme/app_theme.dart';

/// [BuildContext] extension to easily access some context property
extension BuildContextHelper on BuildContext {
  /// return available translated sentences
  AppLocalizations t() {
    return AppLocalizations.of(this)!;
  }

  /// Flutter theme
  ThemeData theme() {
    return Theme.of(this);
  }

  /// Application theme
  AppTheme appTheme() {
    return Theme.of(this).app;
  }
}

/// [ThemeData] extension to easily access [AppTheme]
extension ThemeDataHelper on ThemeData {
  /// Shortcut to retrieve the application theme
  AppTheme get app {
    return extension<AppTheme>()!;
  }
}
