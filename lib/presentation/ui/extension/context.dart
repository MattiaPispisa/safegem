import 'package:flutter/material.dart';
import 'package:safegem/l10n/app_localizations.dart';

extension BuildContextHelper on BuildContext {
  AppLocalizations t() {
    return AppLocalizations.of(this)!;
  }
}
