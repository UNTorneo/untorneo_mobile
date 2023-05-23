enum TournamentVisibility {
  public(translation: 'Publico'),
  private(translation: 'Privado');

  const TournamentVisibility({required this.translation});

  final String translation;
}
