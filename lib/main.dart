import 'package:flutter/material.dart';
import 'package:safegem/bootstrap.dart';
import 'package:safegem/injection.dart';

void main() {
  bootstrap(then: () => const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: getIt<RouterConfig<Object>>(),
    );
  }
}
