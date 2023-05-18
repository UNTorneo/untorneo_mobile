final class MatchesQuerys {
  static const getMatches = r'''
    query GetMatches {
      getMatches {
        id
        tournamentId {
          name
        }
        homeTeam {
          name
        }
        visitingTeam {
          name
        }
        homeTeamScore
        visitingTeamScore
        date
        courtId
        status
        createdAt
        updatedAt
      }
    }
  ''';
}
