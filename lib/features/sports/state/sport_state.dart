import 'package:equatable/equatable.dart';
import 'package:untorneo_mobile/core/sealed/async_state.dart';
import 'package:untorneo_mobile/features/sports/models/sport_mode_model.dart';
import 'package:untorneo_mobile/features/sports/models/sport_model.dart';

final class SportState extends Equatable {
  const SportState({
    required this.sports,
    required this.sportMode,
  });

  factory SportState.initial() {
    return const SportState(
      sports: AsyncState.initial(),
      sportMode: AsyncState.initial(),
    );
  }

  final AsyncState<List<SportModel>> sports;
  final AsyncState<List<SportModeModel>> sportMode;

  @override
  List<Object?> get props => [sports, sportMode];

  SportState copyWith({
    AsyncState<List<SportModel>>? sports,
    AsyncState<List<SportModeModel>>? sportMode,
  }) {
    return SportState(
      sports: sports ?? this.sports,
      sportMode: sportMode ?? this.sportMode,
    );
  }
}
