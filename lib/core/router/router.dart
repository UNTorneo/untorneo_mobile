import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:untorneo_mobile/core/sealed/async_state.dart';
import 'package:untorneo_mobile/features/auth/state/auth_provider.dart';
import 'package:untorneo_mobile/features/auth/ui/login_screen.dart';
import 'package:untorneo_mobile/features/chats/after_match/after_match_chats_screen.dart';
import 'package:untorneo_mobile/features/chats/widgets/chat_screen.dart';
import 'package:untorneo_mobile/features/clans/ui/clans_screen.dart';
import 'package:untorneo_mobile/features/tournaments/ui/create_tournament_screen.dart';
import 'package:untorneo_mobile/features/users/ui/my_profile_screen.dart';
import 'package:untorneo_mobile/features/users/ui/profile_detail_screen.dart';
import 'package:untorneo_mobile/features/auth/ui/sign_up_screen.dart';
import 'package:untorneo_mobile/features/clans/ui/clan_detail_screen.dart';
import 'package:untorneo_mobile/features/error/error_screen.dart';
import 'package:untorneo_mobile/features/home/ui/home_index_screen.dart';
import 'package:untorneo_mobile/features/tournament_venues/ui/create_venue_form.dart';
import 'package:untorneo_mobile/features/matches/ui/matches_detail_screen.dart';
import 'package:untorneo_mobile/features/tournament_venues/ui/tournament_venues_home_screen.dart';
import 'package:untorneo_mobile/features/tournaments/ui/tournament_detail_screen.dart';

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
        ...authRoutes,
        ...tournamentRoutes,
        ...userRoutes,
        ...venueRoutes,
        ...clansRoutes,
        ...matchesRoutes,
        ...chatsRoutes,
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
          path: IndexHomeScreen.route,
          builder: (context, state) => const IndexHomeScreen(),
        ),
      ];

  static final authRoutes = <RouteBase>[
    GoRoute(
      path: SignUpScreen.route,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: LoginScreen.route,
      builder: (context, state) => const LoginScreen(),
    ),
  ];

  static final clansRoutes = <RouteBase>[
    GoRoute(
      path: ClanDetailScreen.routeParams,
      builder: (context, state) {
        final id = state.pathParameters['id'];
        if (id == null) {
          return ErrorScreen(error: atributeErrorMessage('id'));
        }
        return ClanDetailScreen(
          clanId: id,
        );
      },
    ),
    GoRoute(
      path: ClansScreen.route,
      builder: (context, state) {
        return const ClansScreen();
      },
    ),
  ];

  static final chatsRoutes = <RouteBase>[
    GoRoute(
      path: AfterMatchChatsHomeScreen.route,
      builder: (context, state) => const AfterMatchChatsHomeScreen(),
    ),
    GoRoute(
      path: ChatScreen.route,
      builder: (context, state) => const ChatScreen(),
    )
  ];

  static final matchesRoutes = <RouteBase>[
    GoRoute(
      path: MatchesDetailScreen.routeParams,
      builder: (context, state) {
        final id = state.pathParameters['id'];
        if (id == null) {
          return ErrorScreen(error: atributeErrorMessage('id'));
        }
        return MatchesDetailScreen(id: id);
      },
    ),
  ];

  static final tournamentRoutes = <RouteBase>[
    GoRoute(
      path: TournamentDetailScreen.routeParams,
      builder: (context, state) {
        final id = state.pathParameters['id'];
        if (id == null) {
          return ErrorScreen(error: atributeErrorMessage('id'));
        }
        return TournamentDetailScreen(tournamentId: id);
      },
    ),
    GoRoute(
      path: CreateTournamentScreen.route,
      builder: (context, state) => const CreateTournamentScreen(),
    ),
  ];

  static final venueRoutes = <RouteBase>[
    GoRoute(
      path: TournamentVenuesHomeScreen.route,
      builder: (context, state) {
        return const TournamentVenuesHomeScreen();
      },
    ),
    GoRoute(
      path: CreateVenueFormScreen.route,
      builder: (context, state) {
        return const CreateVenueFormScreen();
      },
    ),
  ];

  static final userRoutes = <RouteBase>[
    GoRoute(
      path: ProfileDetailScreen.routeParams,
      builder: (context, state) {
        final id = state.pathParameters['id'];
        if (id == null) {
          return ErrorScreen(error: atributeErrorMessage('id'));
        }
        return ProfileDetailScreen(userId: id);
      },
    ),
    GoRoute(
      path: MyProfileScreen.route,
      builder: (context, state) => const MyProfileScreen(),
    ),
  ];

  static String atributeErrorMessage(String atribute) {
    return 'Es necesario el parametro $atribute';
  }

  List<String> unAuthenticatedRoutes = [
    LoginScreen.route,
    SignUpScreen.route,
    ErrorScreen.route,
  ];

  String? redirect(BuildContext context, GoRouterState state) {
    final isLoggingIn = unAuthenticatedRoutes.contains(state.location) ;
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
