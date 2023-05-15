import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:untorneo_mobile/core/sealed/async_state.dart';
import 'package:untorneo_mobile/features/auth/state/auth_provider.dart';
import 'package:untorneo_mobile/features/auth/ui/login_screen.dart';
import 'package:untorneo_mobile/features/error/error_screen.dart';
import 'package:untorneo_mobile/features/home/ui/home_index_screen.dart';

final globalKey = GlobalKey<NavigatorState>();

final routerNotifierProvider =
    NotifierProvider<CustomRouter, void>(() => CustomRouter());

final routerProvider = Provider<GoRouter>((ref) {
  final notifier = ref.watch(routerNotifierProvider.notifier);
  return GoRouter(
    initialLocation: LoginScreen.route,
    navigatorKey: globalKey,
    refreshListenable: notifier,
    debugLogDiagnostics: true,
    errorBuilder: (context, state) {
      if (state.error == null) return const ErrorScreen();
      return ErrorScreen(error: state.error.toString());
    },
    routes: notifier.routes,
    redirect: notifier.redirect,
  );
});

class CustomRouter extends Notifier<void> implements Listenable {
  VoidCallback? routerListener;
  bool isAuth = false;

  get routes => [
        ...tournamentRoutes,
        GoRoute(
          path: ErrorScreen.route,
          builder: (context, state) {
            if (state.extra == null || state.extra is! Map) {
              return const ErrorScreen();
            }
            final error = (state.extra as Map<String, dynamic>)['error'];
            if (error == null) {
              return const ErrorScreen();
            }
            return ErrorScreen(error: error);
          },
        ),
        GoRoute(
          path: LoginScreen.route,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: IndexHomeScreen.route,
          builder: (context, state) => const IndexHomeScreen(),
        ),
      ];

  static final tournamentRoutes = <RouteBase>[];

  static String atributeErrorMessage(String atribute) {
    return 'Es necesario el parametro $atribute';
  }

  String? redirect(BuildContext context, GoRouterState state) {
    final isLoggingIn = state.location == LoginScreen.route;
    if (isLoggingIn) {
      return isAuth ? IndexHomeScreen.route : null;
    }
    return isAuth ? null : LoginScreen.route;
  }

  @override
  void addListener(VoidCallback listener) {
    routerListener = listener;
  }

  @override
  FutureOr<void> build() async {
    isAuth =
        ref.watch(authProvider.select((state) => state.authModel)).isSuccess;
    ref.listenSelf((_, __) {
      routerListener?.call();
    });
  }

  @override
  void removeListener(VoidCallback listener) {
    routerListener = null;
  }
}