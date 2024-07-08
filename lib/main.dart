import 'package:flutter/material.dart';
import 'package:safegem/bootstrap.dart';
import 'package:safegem/injection.dart';
import 'package:safegem/l10n/app_localizations.dart';
import 'package:safegem/presentation/ui/widget/widget.dart';

void main() {
  bootstrap(then: () => const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final RouterConfig<Object> _routerConfig;

  @override
  void initState() {
    _routerConfig = getIt<RouterConfig<Object>>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return UserSettingsProvider(
      child: UserTheme(
        builder: (context, theme) {
          return MaterialApp.router(
            theme: theme,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            routerConfig: _routerConfig,
          );
        },
      ),
    );
  }
}
