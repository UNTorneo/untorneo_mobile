final class SportsQuery {
  static const getSports = r'''
    query Sports {
      sports {
        _id
        name
        modes
        description
        imgs
        logo
        recommendation
      }
    }
  ''';

  static const getSportMode = r'''
    query Mode($modeId: String!) {
      mode(id: $modeId) {
        _id
        sportId
        name
        winningPoints
        teamsNumber
        playersPerTeam
        description
        substitutePlayers
      }
    }
    ''';
}
