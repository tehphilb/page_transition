import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/main.dart';

/// The route configuration.
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const Home();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'page1',
          builder: (BuildContext context, GoRouterState state) {
            return const Page1();
          },
        ),
      ],
    ),
  ],
);
