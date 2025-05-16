import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notices_app/common/widgets/appBottomNavigationBar.dart';
import 'package:notices_app/presentation/cubits/navigation_cubit.dart';
import 'package:notices_app/presentation/pages/favorites.dart';
import 'package:notices_app/presentation/pages/home.dart';

final appRouter = GoRouter(
  initialLocation: '/home',
  routes: <RouteBase>[
    ShellRoute(
      routes: <RouteBase>[
        GoRoute(
          path: '/home',
          builder:
              (BuildContext context, GoRouterState state) => const FirstPage(),
        ),
        GoRoute(
          path: '/favorites',
          builder:
              (BuildContext context, GoRouterState state) => const SecondPage(),
        ),
      ],
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return BlocProvider(
          create: (context) => NavigationCubit(),
          child: Scaffold(
            body: child,
            bottomNavigationBar: Appbottomnavigationbar(),
          ),
        );
      },
    ),
  ],
);
