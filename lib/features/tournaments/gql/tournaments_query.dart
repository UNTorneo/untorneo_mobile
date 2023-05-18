final class TournamentQuery {
  static const getTournaments = r'''
    query GetTournaments {
      getTournaments {
        id
        name
        venueName
        access
        status
        createdAt
        updatedAt
      }
    }
  ''';

  static const getTournamentById = r'''
    query GetTournament($getTournamentId: String!) {
      getTournament(id: $getTournamentId) {
        id
        name
        teams
        sportId {
          _id
          name
          modes
          description
          recommendation
        }
        modeId {
          _id
          sportId
          name
          winningPoints
          teamsNumber
          playersPerTeam
          description
          substitutePlayers
        }
        clanId {
          id
          leaderId
          name
          createdAt
        }
        venueId {
          id
          location
          description
          isActive
        }
        venueName
        access
        status
        createdAt
        updatedAt
      }
    }
  ''';
}
