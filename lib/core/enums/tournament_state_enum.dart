import 'package:collection/collection.dart';

enum CurrentTournamentState {
  confirmed(
    value: 'confirmed',
    translation: 'Confirmado',
  ),
  finished(
    value: 'finished',
    translation: 'Finalizado',
  ),
  canceled(
    value: 'canceled',
    translation: 'Cancelado',
  ),
  inProgress(
    value: 'in-progress',
    translation: 'En progreso',
  );

  const CurrentTournamentState({
    required this.value,
    required this.translation,
  });

  static CurrentTournamentState? fromString(String value) {
    return CurrentTournamentState.values
        .firstWhereOrNull((e) => e.value == value);
  }

  final String value;
  final String translation;
}
