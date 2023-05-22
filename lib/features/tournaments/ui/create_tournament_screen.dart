import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untorneo_mobile/core/constants/image_constants.dart';
import 'package:untorneo_mobile/core/sealed/async_state.dart';
import 'package:untorneo_mobile/features/sports/models/sport_model.dart';
import 'package:untorneo_mobile/features/sports/state/sport_provider.dart';
import 'package:untorneo_mobile/widgets/image/image_api_widget.dart';
import 'package:untorneo_mobile/widgets/loading/loading_widget.dart';

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
          Text('Selecciona un deporte', style: theme.titleMedium),
          const SizedBox(height: 12),
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
                ]
              : [
                  Text(
                    'Selecciona un deporte antes de seleccionar un modo...',
                    style: theme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                ]
        ],
      ),
    );
  }
}
