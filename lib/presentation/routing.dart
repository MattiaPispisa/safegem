import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import './ui/view/view.dart';

@module
abstract class RouterConfigModule {
  RouterConfig<Object> get router {
    return GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const HomeView();
          },
        ),
      ],
    );
  }
}
