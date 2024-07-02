import 'package:flutter/material.dart';
import 'package:safegem/bootstrap.dart';
import 'package:safegem/injection.dart';
import 'package:safegem/l10n/app_localizations.dart';
import 'package:safegem/presentation/ui/theme/app_theme.dart';

void main() {
  bootstrap(then: () => const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.light().copyWith(extensions: [AppTheme.light()]),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: getIt<RouterConfig<Object>>(),
    );
  }
}
