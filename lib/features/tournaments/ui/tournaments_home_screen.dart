import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untorneo_mobile/core/sealed/async_state.dart';
import 'package:untorneo_mobile/core/theme/theme.dart';
import 'package:untorneo_mobile/features/tournaments/state/tournament_provider.dart';
import 'package:untorneo_mobile/features/tournaments/ui/widgets/tournament_card.dart';
import 'package:untorneo_mobile/widgets/loading/loading_widget.dart';

class TournamentHome extends ConsumerStatefulWidget {
  const TournamentHome({super.key});

  static const route = '/tournaments';

  @override
  createState() => _TournamentHomeState();
}

class _TournamentHomeState extends ConsumerState<TournamentHome> {
  @override
  Widget build(BuildContext context) {
    final tournamentState = ref.watch(tournamentProvider);
    return tournamentState.tournaments.when(
      onError: (error) => Text(error.message),
      onInitial: () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ref.read(tournamentProvider.notifier).getTournaments();
        });
        return const LoadingWidget();
      },
      onData: (tournaments) => ListView.builder(
        itemCount: tournaments.length,
        itemBuilder: (context, index) =>
            TournamentCard(tournament: tournaments[index]),
      ),
    );
  }
}
