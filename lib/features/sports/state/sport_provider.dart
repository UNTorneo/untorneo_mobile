import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untorneo_mobile/core/sealed/async_state.dart';
import 'package:untorneo_mobile/core/sealed/either.dart';
import 'package:untorneo_mobile/features/sports/models/sport_model.dart';
import 'package:untorneo_mobile/features/sports/repositories/sport_repository.dart';
import 'package:untorneo_mobile/features/sports/state/sport_state.dart';

final sportProvider = StateNotifierProvider<SportNotifier, SportState>(
  SportNotifier.fromRef,
);

class SportNotifier extends StateNotifier<SportState> {
  SportNotifier(this.sportRepository) : super(SportState.initial());

  factory SportNotifier.fromRef(Ref ref) {
    return SportNotifier(ref.read(sportsRepositoryProvider));
  }

  final SportRepository sportRepository;

  Future<void> getSports() async {
    state = state.copyWith(sports: const AsyncState.loading());
    final res = await sportRepository.getSports();
    state = res.fold(
      (l) => state.copyWith(sports: AsyncState.error(l)),
      (r) => state.copyWith(sports: AsyncState.success(r)),
    );
  }

  void onSelectedSport() {
    state = state.copyWith(sportMode: const AsyncState.initial());
  }

  Future<void> getSportModes(SportModel sport) async {
    state = state.copyWith(sportMode: const AsyncState.loading());
    final res = await sportRepository.getSportMode(sport);
    state = res.fold(
      (l) => state.copyWith(sportMode: AsyncState.error(l)),
      (r) => state.copyWith(sportMode: AsyncState.success(r)),
    );
  }
}
