import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:untorneo_mobile/core/constants/lotti_assets.dart';
import 'package:untorneo_mobile/core/sealed/async_state.dart';
import 'package:untorneo_mobile/features/tournament_venues/states/venue_provider.dart';
import 'package:untorneo_mobile/features/tournament_venues/ui/widgets/venue_card.dart';
import 'package:untorneo_mobile/widgets/loading/screen_loading_widget.dart';
import 'package:untorneo_mobile/widgets/widgets/custom_text_field.dart';

class TournamentVenuesHomeScreen extends ConsumerStatefulWidget {
  const TournamentVenuesHomeScreen({super.key});

  static const route = '/tournament_venues_home';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TournamentVenuesHomeScreenState();
}

class _TournamentVenuesHomeScreenState extends ConsumerState<TournamentVenuesHomeScreen> {
  final _toSearchIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final venueState = ref.watch(venueProvider);
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: Column(
            children: [
              const Text(
                'Sedes',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  CustomTextField(
                    label: 'Escribe el id de la sede que quieras buscar',
                    controller: _toSearchIdController,
                    keyboardType: TextInputType.number,
                  ),
                  ElevatedButton(
                    onPressed: _onGetVenueById,
                    child: const Icon(Icons.search),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      venueState.copyWith(
                        venueById: const AsyncState.initial(),
                      );
                    },
                    child: const Icon(Icons.delete),
                  )
                ],
              ),
              Scrollbar(
                child: venueState.venueById.on(
                  onData: (data) => TournamentVenueCard(venue: data),
                  onError: (error) => Text(error.message),
                  onLoading: () => const ScreenLoadingWidget(),
                  onInitial: () => venueState.venues.on(
                    onData: (data) => data.isNotEmpty
                        ? ListView.builder(
                            itemBuilder: (context, index) => TournamentVenueCard(
                              venue: data[index],
                            ),
                          )
                        : Column(
                          children: [
                            Container(
                                alignment: Alignment.center,
                                height: 250,
                                width: 250,
                                child: Lottie.asset(
                                  LottieAssets.notFound,
                                ),
                              ),
                            const Text('No hay ninguna sede'),
                          ],
                        ),
                    onError: (error) => Text(error.message),
                    onLoading: () => const ScreenLoadingWidget(),
                    onInitial: () => const ScreenLoadingWidget(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onGetVenueById() {
    if (_toSearchIdController.value.text.isEmpty) return;
    ref.read(venueProvider.notifier).getVenueById(
          id: int.parse(_toSearchIdController.value.text),
        );
  }
}
