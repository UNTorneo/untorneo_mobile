import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:untorneo_mobile/core/theme/theme.dart';
import 'package:untorneo_mobile/features/tournaments/models/tournament_model.dart';
import 'package:untorneo_mobile/features/tournaments/ui/tournament_detail_screen.dart';

class TournamentCard extends ConsumerWidget {
  const TournamentCard({super.key, required this.tournament});

  final TournamentModel tournament;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: ref.read(themeProvider.notifier).roundedBoxDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(tournament.name, style: theme.titleLarge),
          const Divider(),
          RichText(
            text: TextSpan(
              style: theme.bodyLarge,
              children: [
                const TextSpan(text: 'Estado: '),
                TextSpan(
                  text: tournament.tournamentState?.translation,
                  style: theme.titleMedium,
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              style: theme.bodyLarge,
              children: [
                const TextSpan(text: 'Sede: '),
                TextSpan(
                  text: tournament.venueName ?? 'No definido',
                  style: theme.titleMedium,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          FilledButton(
            onPressed: () => GoRouter.of(context).push(
              '${TournamentDetailScreen.route}/${tournament.id}',
            ),
            child: const Text('Ir al torneo'),
          ),
        ],
      ),
    );
  }
}
