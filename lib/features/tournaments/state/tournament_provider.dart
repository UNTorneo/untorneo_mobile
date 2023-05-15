import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untorneo_mobile/core/sealed/async_state.dart';
import 'package:untorneo_mobile/core/sealed/either.dart';
import 'package:untorneo_mobile/features/tournaments/repositories/tournament_repository.dart';
import 'package:untorneo_mobile/features/tournaments/state/tournament_state.dart';

final tournamentProvider =
    StateNotifierProvider<TournamentNotifier, TournamentState>(
  TournamentNotifier.fromRef,
);

class TournamentNotifier extends StateNotifier<TournamentState> {
  TournamentNotifier(this.tournamentRepository)
      : super(TournamentState.initial());

  factory TournamentNotifier.fromRef(Ref ref) {
    return TournamentNotifier(ref.read(tournamentRepositoryProvider));
  }

  final TournamentRepository tournamentRepository;

  Future<void> getTournaments() async {
    state = state.copyWith(tournaments: const AsyncState.loading());
    final res = await tournamentRepository.getTournaments();
    res.fold(
      (l) => state = state.copyWith(tournaments: AsyncState.error(l)),
      (r) => state = state.copyWith(tournaments: AsyncState.success(r)),
    );
  }
}
