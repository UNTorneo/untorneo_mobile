import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:untorneo_mobile/core/constants/lotti_assets.dart';
import 'package:untorneo_mobile/core/sealed/async_state.dart';
import 'package:untorneo_mobile/features/tournament_venues/states/venue_provider.dart';
import 'package:untorneo_mobile/features/tournament_venues/ui/create_venue_form.dart';
import 'package:untorneo_mobile/features/tournament_venues/ui/widgets/venue_card.dart';
import 'package:untorneo_mobile/widgets/loading/screen_loading_widget.dart';
import 'package:untorneo_mobile/widgets/widgets/custom_text_field.dart';

class TournamentVenuesHomeScreen extends ConsumerStatefulWidget {
  const TournamentVenuesHomeScreen({super.key});

  static const route = '/tournament_venues_home';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TournamentVenuesHomeScreenState();
}

class _TournamentVenuesHomeScreenState
    extends ConsumerState<TournamentVenuesHomeScreen> {
  final _toSearchIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final venueState = ref.watch(venueProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Sedes')),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Flexible(
                child: CustomTextField(
                  label: 'Escribe el id de la sede que quieras buscar',
                  controller: _toSearchIdController,
                  keyboardType: TextInputType.number,
                ),
              ),
              IconButton(
                onPressed: _onGetVenueById,
                icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: () => ref.refresh(venueProvider),
                icon: const Icon(Icons.delete),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton.icon(
            onPressed: _onCreateVenueHandle,
            icon: const Icon(Icons.create),
            label: const Text('Inscribe tu sede'),
          ),
          Expanded(
            child: Scrollbar(
              child: venueState.venueById.on(
                onData: (venue) => ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) =>
                      TournamentVenueCard(venue: venue),
                ),
                onError: (error) => Text(error.message),
                onLoading: () => const ScreenLoadingWidget(),
                onInitial: () => venueState.venues.on(
                  onData: (data) => data.isNotEmpty
                      ? ListView.builder(
                          itemCount: data.length,
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
                  onInitial: () {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      ref.read(venueProvider.notifier).getVenues();
                    });
                    return const ScreenLoadingWidget();
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onGetVenueById() {
    if (_toSearchIdController.value.text.isEmpty) return;
    ref.read(venueProvider.notifier).getVenueById(
          id: int.parse(_toSearchIdController.value.text),
        );
  }

  void _onCreateVenueHandle() {
    GoRouter.of(context).push(
      CreateVenueFormScreen.route,
    );
  }
}
