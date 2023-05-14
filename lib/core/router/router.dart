import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:untorneo_mobile/features/auth/ui/login_screen.dart';
import 'package:untorneo_mobile/features/error/error_screen.dart';
import 'package:untorneo_mobile/features/home/ui/home_index_screen.dart';

final routerProvider = Provider<CustomRouter>((ref) => CustomRouter());

final class CustomRouter {
  CustomRouter();

  static String atributeErrorMessage(String atribute) {
    return 'Es necesario el parametro $atribute';
  }

  static final globalKey = GlobalKey<NavigatorState>();
  BuildContext get context => globalKey.currentState!.context;
  GoRouter get router => goRouter;

  final goRouter = GoRouter(
    initialLocation: LoginScreen.route,
    navigatorKey: globalKey,
    errorBuilder: (context, state) {
      if (state.error == null) {
        return const ErrorScreen();
      }
      return ErrorScreen(error: state.error.toString());
    },
    routes: [
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
    ],
  );

  static final tournamentRoutes = <RouteBase>[];
}
