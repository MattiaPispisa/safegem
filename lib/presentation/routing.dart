import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:safegem/presentation/ui/widget/controllers/controllers.dart';
import './ui/view/view.dart';

@module
abstract class RouterConfigModule {
  RouterConfig<Object> get router {
    return GoRouter(
      routes: [
        ShellRoute(
          builder: (context, state, child) {
            return Startup(
              child: child,
            );
          },
          routes: [
            GoRoute(
              path: '/',
              builder: (BuildContext context, GoRouterState state) {
                return const HomeView();
              },
            ),
          ],
        ),
      ],
    );
  }
}
