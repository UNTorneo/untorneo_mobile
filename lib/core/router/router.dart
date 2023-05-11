import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:untorneo_mobile/features/auth/ui/login_screen.dart';
import 'package:untorneo_mobile/features/error/error_screen.dart';

final routerProvider = Provider<CustomRouter>((ref) {
  return CustomRouter();
});

class CustomRouter {
  CustomRouter();

  static String atributeErrorMessage(String atribute) {
    return 'Es necesario el parametro $atribute';
  }

  static final globalKey = GlobalKey<NavigatorState>();

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
    ],
  );

  

  BuildContext get context => globalKey.currentState!.context;

  GoRouter get router => goRouter;
}
