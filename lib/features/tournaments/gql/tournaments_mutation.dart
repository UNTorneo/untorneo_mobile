final class TournamentMutation {
  static const createTournament = r'''
    mutation AddTournament($tournament: AddTournament) {
      addTournament(tournament: $tournament) {
        ... on SucessResponse {
          message
        }
        ... on ErrorResponse {
          error
        }
      }
    }
  ''';
}
