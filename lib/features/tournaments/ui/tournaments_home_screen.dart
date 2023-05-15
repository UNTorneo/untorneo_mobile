import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untorneo_mobile/core/sealed/async_state.dart';
import 'package:untorneo_mobile/features/tournaments/state/tournament_provider.dart';
import 'package:untorneo_mobile/features/tournaments/ui/widgets/tournament_card.dart';
import 'package:untorneo_mobile/widgets/loading/loading_widget.dart';

class TournamentHome extends ConsumerWidget {
  const TournamentHome({super.key});

  static const route = '/tournaments';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tournamentState = ref.watch(tournamentProvider);
    return tournamentState.tournaments.when(
      onError: (error) => Text(error.message),
      onInitial: () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ref.read(tournamentProvider.notifier).getTournaments();
        });
        return const LoadingWidget();
      },
      onData: (tournaments) => RefreshIndicator.adaptive(
        onRefresh: ref.read(tournamentProvider.notifier).getTournaments,
        child: ListView.builder(
          itemCount: tournaments.length,
          itemBuilder: (_, idx) => TournamentCard(tournament: tournaments[idx]),
        ),
      ),
    );
  }
}
