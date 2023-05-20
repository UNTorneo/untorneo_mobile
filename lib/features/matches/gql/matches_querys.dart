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

  static const getMatch = r'''
    query GetMatch($getMatchId: String!) {
      getMatch(id: $getMatchId) {
        id
        tournamentId {
          id
          name
          venueName
          access
          status
          updatedAt
        }
        homeTeam {
          id
          name
        }
        visitingTeam {
          id
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
