import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:untorneo_mobile/core/constants/lotti_assets.dart';
import 'package:untorneo_mobile/core/sealed/async_state.dart';
import 'package:untorneo_mobile/core/theme/theme.dart';
import 'package:untorneo_mobile/features/matches/state/matches_provider.dart';
import 'package:untorneo_mobile/features/matches/ui/matches_detail_screen.dart';

class MatchesHomeScreen extends ConsumerWidget {
  const MatchesHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).textTheme;
    final matchesState = ref.watch(matchesProvider);
    return matchesState.matches.when(
      onError: (error) => Center(child: Text(error.message)),
      onInitial: () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ref.read(matchesProvider.notifier).getMatches();
        });
        return const Center(child: CircularProgressIndicator());
      },
      onData: (data) => ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final item = data[index];
          return Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            decoration: ref.read(themeProvider.notifier).roundedBoxDecoration,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '${item.homeTeam} vs ${item.visitingTeam}',
                      style: theme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${item.homeTeamScore} - ${item.visitingTeamScore}',
                      style: theme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      item.state.lottieAsset,
                      width: 200,
                      height: 200,
                      alignment: Alignment.center,
                    ),
                  ],
                ),
                RichText(
                  text: TextSpan(
                    style: theme.bodyLarge,
                    children: [
                      const TextSpan(text: 'Estado: '),
                      TextSpan(
                        text: item.state.translation,
                        style: theme.titleMedium,
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: theme.bodyLarge,
                    children: [
                      const TextSpan(text: 'Torneo: '),
                      TextSpan(
                        text: item.tournamentName,
                        style: theme.titleMedium,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                FilledButton(
                  onPressed: () => GoRouter.of(context)
                      .push('${MatchesDetailScreen.route}/${item.id}'),
                  child: const Text('Ir al partido'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
