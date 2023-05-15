import 'package:untorneo_mobile/core/constants/lotti_assets.dart';

enum CurrentMatcheState {
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
  postponed(
    value: 'postponed',
    translation: 'Pospuesto',
    lottieAsset: LottieAssets.waiting,
  ),
  unknown(
    value: 'unknown',
    translation: 'Desconocido',
    lottieAsset: LottieAssets.unknow,
  ),
  playing(
    value: 'playing',
    translation: 'Jugando',
    lottieAsset: LottieAssets.matchScore,
  );

  const CurrentMatcheState({
    required this.value,
    required this.translation,
    required this.lottieAsset,
  });

  static CurrentMatcheState fromString(String value) {
    return CurrentMatcheState.values.firstWhere(
      (e) => e.value == value,
      orElse: () => CurrentMatcheState.unknown,
    );
  }

  final String value;
  final String translation;
  final String lottieAsset;
}
