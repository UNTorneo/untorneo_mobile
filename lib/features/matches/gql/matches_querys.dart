final class MatchesQuerys {
  static const getMatches = r'''
    query GetTournamentsByStatus($status: String!) {
      getTournamentsByStatus(status: $status) {
        id
        name
        teams
        sportId
        modeId
        clanId
        venueId
        venueName
        access
        status
        createdAt
        updatedAt
      }
    }
  ''';
}
