import 'package:equatable/equatable.dart';
import 'package:untorneo_mobile/core/sealed/async_state.dart';
import 'package:untorneo_mobile/features/matches/models/matches_model.dart';

final class MatchesState extends Equatable {
  const MatchesState({
    required this.matches,
  });

  factory MatchesState.initial() {
    return const MatchesState(
      matches: AsyncState.initial(),
    );
  }

  final AsyncState<List<MatchesModel>> matches;

  @override
  List<Object?> get props => [matches];

  MatchesState copyWith({
    AsyncState<List<MatchesModel>>? matches,
  }) {
    return MatchesState(
      matches: matches ?? this.matches,
    );
  }
}
