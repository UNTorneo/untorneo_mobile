import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:untorneo_mobile/core/sealed/async_state.dart';
import 'package:untorneo_mobile/features/error/error_screen.dart';
import 'package:untorneo_mobile/features/matches/state/matches_provider.dart';
import 'package:untorneo_mobile/widgets/loading/screen_loading_widget.dart';

class MatchesDetailScreen extends ConsumerStatefulWidget {
  const MatchesDetailScreen({required this.id, super.key});

  static const route = '/matches';
  static const routeParams = '/matches/:id';
  final String id;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MatchesDetailScreenState();
}

class _MatchesDetailScreenState extends ConsumerState<MatchesDetailScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(matchesProvider.notifier).getMatch(widget.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final matchState = ref.watch(matchesProvider);
    final theme = Theme.of(context);
    return matchState.match.when(
      onLoading: () => const LoadingScreen(),
      onError: (failure) => ErrorScreen(error: failure.message),
      onData: (match) => Scaffold(
        appBar: AppBar(title: const Text('Detalles del partido')),
        body: ListView(
          children: [
            Text(
              '${match.homeTeam} vs ${match.visitingTeam}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
            ),
            const Text(
              'Marcador',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 22),
            ),
            Lottie.asset(match.state.lottieAsset, height: 200),
            Text(
              '${match.homeTeamScore} - ${match.visitingTeamScore}',
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            Text(
              match.state.translation,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
