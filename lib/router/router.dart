import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../src/presentaion/blocs/auth_bloc.dart';
import '../src/presentaion/blocs/auth_state.dart';
import '../src/presentaion/screen/home_screen.dart';
import '../src/presentaion/screen/login_screen.dart';

final GoRouter router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) =>
          const HomeScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) =>
          const LoginScreen(),
    ),
  ],
  redirect: (BuildContext context, GoRouterState state) {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    final loggedIn = authBloc.state.status == AuthStatus.authenticated;
    final loggingIn = state.uri.toString() == '/login';

    // If not logged in and not already on login page, redirect to login
    if (!loggedIn && !loggingIn) {
      return '/login';
    }

    // If logged in and on login page, redirect to home
    if (loggedIn && loggingIn) {
      return '/';
    }

    // No need to redirect
    return null;
  },
);
