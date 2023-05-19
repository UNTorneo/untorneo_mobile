import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untorneo_mobile/core/sealed/async_state.dart';
import 'package:untorneo_mobile/core/utils/formatters.dart';
import 'package:untorneo_mobile/features/error/error_screen.dart';
import 'package:untorneo_mobile/features/tournaments/state/tournament_provider.dart';
import 'package:untorneo_mobile/widgets/fields/field_item_widget.dart';
import 'package:untorneo_mobile/widgets/loading/screen_loading_widget.dart';

class TournamentDetailScreen extends ConsumerStatefulWidget {
  const TournamentDetailScreen({super.key, required this.tournamentId});

  static const route = '/tournaments';
  static const routeParams = '/tournaments/:id';

  final String tournamentId;

  @override
  createState() => _TournamentDetailScreenState();
}

class _TournamentDetailScreenState
    extends ConsumerState<TournamentDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(tournamentProvider.notifier)
          .getTournamentPopulated(widget.tournamentId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final tournamentState = ref.watch(tournamentProvider);
    return tournamentState.tournamentVenuePopulated.when(
      onError: (error) => ErrorScreen(error: error.message),
      onInitial: () => const Scaffold(body: ScreenLoadingWidget()),
      onLoading: () => const Scaffold(body: ScreenLoadingWidget()),
      onData: (tournamentDetail) => Scaffold(
        appBar: AppBar(title: Text(tournamentDetail.name)),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text('Deporte', style: theme.titleLarge),
            Text(tournamentDetail.sport.name, style: theme.titleMedium),
            const SizedBox(height: 12),
            Text('Descripción', style: theme.titleMedium),
            Text(tournamentDetail.sport.description, style: theme.bodyMedium),
            const SizedBox(height: 12),
            Text('Recomendaciones', style: theme.titleMedium),
            ...(tournamentDetail.sport.recommendation ?? [])
                .map((e) => Text('- $e')),
            const SizedBox(height: 12),
            const Divider(),
            Text('Equipos', style: theme.titleLarge),
            const SizedBox(height: 12),
            ...tournamentDetail.teams.map(
              (e) => Text('- $e', style: theme.titleMedium),
            ),
            const SizedBox(height: 12),
            const Divider(),
            Text('Modo', style: theme.titleLarge),
            Text(tournamentDetail.mode.name, style: theme.titleMedium),
            const SizedBox(height: 12),
            if (tournamentDetail.mode.description != null) ...[
              Text('Descripción', style: theme.titleMedium),
              Text(tournamentDetail.mode.description!, style: theme.bodyMedium),
              const SizedBox(height: 12),
            ],
            if (tournamentDetail.mode.winningPoints != null) ...[
              FieldItemWidget(
                title: 'Puntos para ganar',
                value: tournamentDetail.mode.winningPoints.toString(),
              ),
              const SizedBox(height: 12),
            ],
            if (tournamentDetail.mode.playersPerTeam != null) ...[
              FieldItemWidget(
                title: 'Jugadores por equipo',
                value: tournamentDetail.mode.playersPerTeam.toString(),
              ),
              const SizedBox(height: 12),
            ],
            if (tournamentDetail.mode.teamsNumber != null) ...[
              FieldItemWidget(
                title: 'Número de equipos',
                value: tournamentDetail.mode.teamsNumber.toString(),
              ),
              const SizedBox(height: 12),
            ],
            const Divider(),
            if (tournamentDetail.clan != null) ...[
              Text('Clan', style: theme.titleLarge),
              Text(tournamentDetail.clan!.name, style: theme.titleMedium),
              const SizedBox(height: 12),
              FieldItemWidget(
                title: 'Creado el',
                value:
                    Formatters.dateFormatter(tournamentDetail.clan!.createdAt),
              ),
              const SizedBox(height: 12),
              const Divider(),
            ],
            if (tournamentDetail.venue != null) ...[
              Text('Sede', style: theme.titleLarge),
              Text(tournamentDetail.venue!.location, style: theme.titleMedium),
              const SizedBox(height: 12),
              Text('Ubicación', style: theme.titleMedium),
              Text(tournamentDetail.venue!.location, style: theme.bodyMedium),
              const SizedBox(height: 12),
              Text('Descripción', style: theme.titleMedium),
              Text(
                tournamentDetail.venue!.description,
                style: theme.bodyMedium,
              ),
              const SizedBox(height: 12),
              const Divider(),
            ],
          ],
        ),
      ),
    );
  }
}
