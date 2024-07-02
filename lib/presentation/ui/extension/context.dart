import 'package:flutter/material.dart';
import 'package:safegem/l10n/app_localizations.dart';
import 'package:safegem/presentation/ui/theme/app_theme.dart';

extension BuildContextHelper on BuildContext {
  AppLocalizations t() {
    return AppLocalizations.of(this)!;
  }

  ThemeData theme() {
    return Theme.of(this);
  }

  AppTheme appTheme() {
    return Theme.of(this).extension<AppTheme>()!;
  }
}
