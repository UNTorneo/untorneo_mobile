import 'package:equatable/equatable.dart';
import 'package:untorneo_mobile/core/sealed/async_state.dart';
import 'package:untorneo_mobile/features/tournaments/models/tournament_model.dart';
import 'package:untorneo_mobile/features/tournaments/models/tournament_model_populated.dart';

final class TournamentState extends Equatable {
  const TournamentState({
    required this.tournaments,
    required this.tournamentVenuePopulated,
  });

  factory TournamentState.initial() {
    return const TournamentState(
      tournaments: AsyncState.initial(),
      tournamentVenuePopulated: AsyncState.initial(),
    );
  }

  final AsyncState<List<TournamentModel>> tournaments;
  final AsyncState<TournamentVenuePopulated> tournamentVenuePopulated;

  @override
  List<Object?> get props => [tournaments];

  TournamentState copyWith({
    AsyncState<List<TournamentModel>>? tournaments,
    AsyncState<TournamentVenuePopulated>? tournamentVenuePopulated,
  }) {
    return TournamentState(
      tournaments: tournaments ?? this.tournaments,
      tournamentVenuePopulated:
          tournamentVenuePopulated ?? this.tournamentVenuePopulated,
    );
  }
}
