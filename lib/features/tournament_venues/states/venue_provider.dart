import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untorneo_mobile/core/external/gql_handler.dart';
import 'package:untorneo_mobile/core/sealed/async_state.dart';
import 'package:untorneo_mobile/core/sealed/either.dart';
import 'package:untorneo_mobile/features/tournament_venues/states/venue_state.dart';
import 'package:untorneo_mobile/features/tournament_venues/repositories/venue_repository.dart';

final graphQLProvider = Provider<GraphQLHandler>(GraphQLHandler.fromRef);

final venueProvider = StateNotifierProvider<VenueProvider, VenueState>((ref) {
  return VenueProvider.fromRead(ref);
});

class VenueProvider extends StateNotifier<VenueState> {
  VenueProvider({
    required this.venueRepository,
    required this.ref,
  }) : super(
          const VenueState(venueById: AsyncState.initial(), venues: AsyncState.initial()),
        );

  factory VenueProvider.fromRead(Ref ref) {
    final venueRepository = ref.read(venueRepositoryProvider);
    return VenueProvider(
      ref: ref,
      venueRepository: venueRepository,
    );
  }

  final Ref ref;
  final VenueRepository venueRepository;

  Future<void> getVenueById({required int id}) async {
    if (id <= 0) return;
    state = state.copyWith(venueById: const AsyncState.loading());
    final result = await venueRepository.getVenueById(id);
    result.fold(
      (l) => state = state.copyWith(venueById: AsyncState.error(l)),
      (r) => state = state.copyWith(
          venueById: AsyncState.success(r),
        ),
    );
  }

  Future<void> getVenues() async {
    state = state.copyWith(venues: const AsyncState.loading());
    final result = await venueRepository.getVenues();
    state = result.fold(
      (l) => state.copyWith(venues: AsyncState.error(l)),
      (r) => state.copyWith(
        venues: AsyncState.success(r),
      ),
    );
    state;
  }
}
