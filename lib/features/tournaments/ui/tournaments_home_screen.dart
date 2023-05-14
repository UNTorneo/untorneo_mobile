import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TournamentHome extends ConsumerStatefulWidget {
  const TournamentHome({super.key});

  static const route = '/tournaments';

  @override
  createState() => _TournamentHomeState();
}

class _TournamentHomeState extends ConsumerState<TournamentHome> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
      ],
    );
  }
}
