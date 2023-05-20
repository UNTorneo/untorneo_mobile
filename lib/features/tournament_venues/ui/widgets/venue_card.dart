import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untorneo_mobile/core/theme/theme.dart';
import 'package:untorneo_mobile/features/tournament_venues/models/venue_model.dart';

class TournamentVenueCard extends ConsumerWidget {
  const TournamentVenueCard({super.key, required this.venue});

  final Venue venue;

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
          Text(venue.description, style: theme.bodyMedium),
          const Divider(),
          RichText(
            text: TextSpan(
              style: theme.bodyLarge,
              children: [
                const TextSpan(text: 'Estado: '),
                TextSpan(
                  text: venue.isActive ? 'Activa' : 'Cerrada',
                  style: theme.titleSmall,
                ),
              ],
            ),
          ),
          /*
          const SizedBox(height: 10),
          FilledButton(
            onPressed: () => GoRouter.of(context).push(
              '${TournamentDetailScreen.route}/${tournament.id}',
            ),
            child: const Text('Ir al torneo'),
          ),
          */
        ],
      ),
    );
  }
}
