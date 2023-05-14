import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untorneo_mobile/core/constants/image_constants.dart';
import 'package:untorneo_mobile/features/tournaments/ui/tournaments_home_screen.dart';

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
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_outlined),
            onPressed: () {},
          ),
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
            icon: Icon(Icons.explore_outlined),
            label: 'Explorar',
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
        Center(child: Text('Explorar')),
        Center(child: Text('Clanes')),
        Center(child: Text('Mi perfil')),
      ][_currentIndex],
    );
  }
}
