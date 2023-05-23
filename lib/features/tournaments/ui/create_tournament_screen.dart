import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untorneo_mobile/core/constants/image_constants.dart';
import 'package:untorneo_mobile/core/enums/tournament_visibility.dart';
import 'package:untorneo_mobile/core/sealed/async_state.dart';
import 'package:untorneo_mobile/features/clans/states/clan_provider.dart';
import 'package:untorneo_mobile/features/sports/models/sport_mode_model.dart';
import 'package:untorneo_mobile/features/sports/models/sport_model.dart';
import 'package:untorneo_mobile/features/sports/state/sport_provider.dart';
import 'package:untorneo_mobile/features/tournaments/models/create_tournament_model.dart';
import 'package:untorneo_mobile/features/tournaments/state/tournament_provider.dart';
import 'package:untorneo_mobile/widgets/image/image_api_widget.dart';
import 'package:untorneo_mobile/widgets/loading/loading_widget.dart';
import 'package:untorneo_mobile/widgets/widgets/custom_text_field.dart';

class CreateTournamentScreen extends ConsumerStatefulWidget {
  const CreateTournamentScreen({super.key});

  static const route = '/create-tournament';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateTournamentScreenState();
}

class _CreateTournamentScreenState
    extends ConsumerState<CreateTournamentScreen> {
  SportModel? selectedSport;
  SportModeModel? selectedMode;
  TournamentVisibility? selectedVisibility;
  final _tournamentNameController = TextEditingController();
  final _tournamentVenueController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final sportsState = ref.watch(sportProvider);
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Crear torneo')),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(height: 12),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nombre del torneo', style: theme.titleMedium),
                const SizedBox(height: 6),
                CustomTextField(
                  label: 'Nombre del torneo',
                  controller: _tournamentNameController,
                ),
                const SizedBox(height: 10),
                Text('Lugar de campeonato', style: theme.titleMedium),
                const SizedBox(height: 6),
                CustomTextField(
                  label: 'Lugar de campeonato',
                  controller: _tournamentVenueController,
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Text('Selecciona un deporte', style: theme.titleMedium),
          sportsState.sports.when(
            onInitial: () {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ref.read(sportProvider.notifier).getSports();
              });
              return const LoadingWidget();
            },
            onError: (error) => Text(error.toString()),
            onData: (sports) => GridView.builder(
              shrinkWrap: true,
              itemCount: sports.length,
              primary: false,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.2,
              ),
              itemBuilder: (context, index) {
                final sport = sports[index];
                final isSelected = selectedSport == sport;
                return Card(
                  child: InkWell(
                    onTap: () {
                      selectedSport = sport;
                      ref.read(sportProvider.notifier).getSportModes(sport);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        sport.logo != null
                            ? ImageApi(
                                sport.logo!,
                                height: isSelected ? 70 : 50,
                                width: isSelected ? 70 : 50,
                                errorImage: ImageAssets.logo,
                              )
                            : FlutterLogo(
                                size: isSelected ? 50 : 40,
                              ),
                        Text(
                          sport.name,
                          style: isSelected
                              ? theme.bodyMedium?.copyWith(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                )
                              : theme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          ...selectedSport != null
              ? [
                  Text('Selecciona un modo', style: theme.titleMedium),
                  const SizedBox(height: 12),
                  sportsState.sportMode.when(
                    onError: (error) => Text(error.toString()),
                    onData: (modes) => ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: modes.length,
                      itemBuilder: (ctx, i) => CheckboxListTile.adaptive(
                        value: modes[i] == selectedMode,
                        title: Text(modes[i].name),
                        subtitle: Text(modes[i].description),
                        onChanged: (value) {
                          selectedMode = modes[i];
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                ]
              : [
                  Text(
                    'Selecciona un deporte antes de seleccionar un modo...',
                    style: theme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
          ...selectedMode != null
              ? [
                  Text('Selecciona la visibilidad', style: theme.titleMedium),
                  const SizedBox(height: 12),
                  ...TournamentVisibility.values
                      .map(
                        (e) => CheckboxListTile.adaptive(
                          value: selectedVisibility == e,
                          onChanged: (value) {
                            selectedVisibility = e;
                            setState(() {});
                          },
                          title: Text(e.translation),
                        ),
                      )
                      .toList(),
                ]
              : const [SizedBox.shrink()],
          const SizedBox(height: 12),
          FilledButton(
            onPressed: _onCreateTournament,
            child: const Text('Crear torneo'),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  void _onCreateTournament() {
    if (_formKey.currentState?.validate() == false) return;
    if (selectedSport == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Selecciona un deporte'),
        ),
      );
      return;
    }
    if (selectedMode == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Selecciona un modo'),
        ),
      );
      return;
    }
    if (selectedVisibility == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Selecciona una visibilidad'),
        ),
      );
      return;
    }
    final clanId = ref.read(clanProvider).selectedClan;
    final tournamentName = _tournamentNameController.text;
    final teams = <String>[];
    final tournamentVenue = _tournamentVenueController.text;
    final tournament = CreateTournamentModel(
      name: tournamentName,
      teams: teams,
      sport: selectedSport!.id,
      mode: selectedMode!.id,
      visibility: selectedVisibility!.name,
      venue: tournamentVenue,
      clanId: clanId.toString(),
    );
    ref.read(tournamentProvider.notifier).createTournament(tournament);
  }
}
