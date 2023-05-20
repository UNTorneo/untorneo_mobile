import 'package:equatable/equatable.dart';
import 'package:untorneo_mobile/core/sealed/async_state.dart';
import 'package:untorneo_mobile/features/matches/models/match_model.dart';
import 'package:untorneo_mobile/features/matches/models/matches_model.dart';

final class MatchesState extends Equatable {
  const MatchesState({
    required this.matches,
    required this.match,
  });

  factory MatchesState.initial() {
    return const MatchesState(
      matches: AsyncState.initial(),
      match: AsyncState.initial(),
    );
  }

  final AsyncState<List<MatchesModel>> matches;
  final AsyncState<MatchModel> match;

  @override
  List<Object?> get props => [matches];

  MatchesState copyWith({
    AsyncState<List<MatchesModel>>? matches,
    AsyncState<MatchModel>? match,
  }) {
    return MatchesState(
      matches: matches ?? this.matches,
      match: match ?? this.match,
    );
  }
}
