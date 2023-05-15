final class TournamentQuery {
  static const getTournaments = r'''
    query GetTournaments {
      getTournaments {
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
