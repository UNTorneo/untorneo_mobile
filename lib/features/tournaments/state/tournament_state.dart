import 'package:equatable/equatable.dart';
import 'package:untorneo_mobile/core/sealed/async_state.dart';
import 'package:untorneo_mobile/features/tournaments/models/tournament_model.dart';

final class TournamentState extends Equatable {
  const TournamentState({required this.tournaments});

  factory TournamentState.initial() {
    return const TournamentState(
      tournaments: AsyncState.initial(),
    );
  }

  final AsyncState<List<TournamentModel>> tournaments;

  @override
  List<Object?> get props => [tournaments];

  TournamentState copyWith({
    AsyncState<List<TournamentModel>>? tournaments,
  }) {
    return TournamentState(
      tournaments: tournaments ?? this.tournaments,
    );
  }
}
