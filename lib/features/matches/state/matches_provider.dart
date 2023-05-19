import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untorneo_mobile/core/sealed/async_state.dart';
import 'package:untorneo_mobile/core/sealed/either.dart';
import 'package:untorneo_mobile/features/matches/repositories/matches_repository.dart';
import 'package:untorneo_mobile/features/matches/state/matches_state.dart';

final matchesProvider = StateNotifierProvider<MatchesNotifier, MatchesState>(
  MatchesNotifier.fromRef,
);

class MatchesNotifier extends StateNotifier<MatchesState> {
  MatchesNotifier(this.matchesRepository) : super(MatchesState.initial());

  factory MatchesNotifier.fromRef(Ref ref) {
    return MatchesNotifier(ref.read(matchesRepositoryProvider));
  }

  final MatchesRepository matchesRepository;

  Future<void> getMatches() async {
    state = state.copyWith(matches: const AsyncState.loading());
    final res = await matchesRepository.getMatches();
    res.fold(
      (l) => state = state.copyWith(matches: AsyncState.error(l)),
      (r) => state = state.copyWith(matches: AsyncState.success(r)),
    );
  }

  Future<void> getMatch(String id) async {
    state = state.copyWith(match: const AsyncState.loading());
    final res = await matchesRepository.getMatch(id);
    res.fold(
      (l) => state = state.copyWith(match: AsyncState.error(l)),
      (r) => state = state.copyWith(match: AsyncState.success(r)),
    );
  }
}
