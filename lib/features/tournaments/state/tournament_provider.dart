import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untorneo_mobile/core/router/router.dart';
import 'package:untorneo_mobile/core/sealed/async_state.dart';
import 'package:untorneo_mobile/core/sealed/either.dart';
import 'package:untorneo_mobile/features/error/error_screen.dart';
import 'package:untorneo_mobile/features/tournaments/models/create_tournament_model.dart';
import 'package:untorneo_mobile/features/tournaments/repositories/tournament_repository.dart';
import 'package:untorneo_mobile/features/tournaments/state/tournament_state.dart';

final tournamentProvider =
    StateNotifierProvider<TournamentNotifier, TournamentState>(
  TournamentNotifier.fromRef,
);

class TournamentNotifier extends StateNotifier<TournamentState> {
  TournamentNotifier(this.tournamentRepository, this.ref)
      : super(TournamentState.initial());

  factory TournamentNotifier.fromRef(Ref ref) {
    return TournamentNotifier(ref.read(tournamentRepositoryProvider), ref);
  }

  final TournamentRepository tournamentRepository;
  final Ref ref;

  Future<void> getTournaments() async {
    state = state.copyWith(tournaments: const AsyncState.loading());
    final res = await tournamentRepository.getTournaments();
    res.fold(
      (l) => state = state.copyWith(tournaments: AsyncState.error(l)),
      (r) => state = state.copyWith(tournaments: AsyncState.success(r)),
    );
  }

  Future<void> getTournamentPopulated(String id) async {
    state =
        state.copyWith(tournamentVenuePopulated: const AsyncState.loading());
    final res = await tournamentRepository.getTournamentVenuePopulated(id);
    res.fold(
      (l) =>
          state = state.copyWith(tournamentVenuePopulated: AsyncState.error(l)),
      (r) => state =
          state.copyWith(tournamentVenuePopulated: AsyncState.success(r)),
    );
  }

  Future<void> createTournament(
    CreateTournamentModel createTournament,
  ) async {
    final res = await tournamentRepository.createTournament(createTournament);
    if (res != null) {
      ref.read(routerProvider).push(ErrorScreen.route);
    } else {
      ref.read(routerProvider).pop();
      ref.read(routerProvider).pop();
      getTournaments();
    }
  }
}
