import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:untorneo_mobile/core/constants/image_constants.dart';
import 'package:untorneo_mobile/features/chats/after_match/after_match_chats_screen.dart';
import 'package:untorneo_mobile/features/clans/ui/clans_screen.dart';
import 'package:untorneo_mobile/features/matches/ui/matches_home_screen.dart';
import 'package:untorneo_mobile/features/tournament_venues/ui/tournament_venues_home_screen.dart';
import 'package:untorneo_mobile/features/tournaments/ui/tournaments_home_screen.dart';
import 'package:untorneo_mobile/features/users/ui/my_profile_screen.dart';

class IndexHomeScreen extends ConsumerStatefulWidget {
  const IndexHomeScreen({super.key});

  static const route = '/';

  @override
  createState() => _IndexHomeScreenState();
}

class _IndexHomeScreenState extends ConsumerState<IndexHomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImageAssets.logo, height: 45),
            const Text('UnTorneo'),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () => GoRouter.of(context).push(TournamentVenuesHomeScreen.route),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_outlined),
            onPressed: () {},
          ),
          IconButton(
            onPressed: () => GoRouter.of(context).push(AfterMatchChatsHomeScreen.route),
            icon: const Icon(Icons.chat_outlined),
          )
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (idx) => setState(() => _currentIndex = idx),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.sports_soccer),
            label: 'Torneos',
          ),
          NavigationDestination(
            icon: Icon(Icons.sports_football_outlined),
            label: 'Partidos',
          ),
          NavigationDestination(
            icon: Icon(Icons.group_outlined),
            label: 'Clanes',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: 'Mi perfil',
          ),
        ],
      ),
      body: const [
        TournamentHome(),
        MatchesHomeScreen(),
        ClansScreen(),
        MyProfileScreen(),
      ][_currentIndex],
    );
  }
}
