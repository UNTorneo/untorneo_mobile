import 'package:collection/collection.dart';
import 'package:untorneo_mobile/core/constants/lotti_assets.dart';

enum CurrentTournamentState {
  confirmed(
    value: 'confirmed',
    translation: 'Confirmado',
    lottieAsset: LottieAssets.confirmed,
  ),
  finished(
    value: 'finished',
    translation: 'Finalizado',
    lottieAsset: LottieAssets.victory,
  ),
  canceled(
    value: 'canceled',
    translation: 'Cancelado',
    lottieAsset: LottieAssets.cancelled,
  ),
  inProgress(
    value: 'in-progress',
    translation: 'En progreso',
    lottieAsset: LottieAssets.matchScore,
  );

  const CurrentTournamentState({
    required this.value,
    required this.translation,
    required this.lottieAsset,
  });

  static CurrentTournamentState? fromString(String value) {
    return CurrentTournamentState.values.firstWhereOrNull((e) => e.value == value);
  }

  final String value;
  final String translation;
  final String lottieAsset;
}
