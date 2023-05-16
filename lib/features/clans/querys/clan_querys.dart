final class ClanQuerys {
  static const clans = r'''
    query Clans() {
      clans {
        id
        leaderId
        name
        createdAt
      }
    }
  ''';

  static const getClanById = r'''
    query ClanById($clanByIdId: Int!) {
      clanById(id: $clanByIdId) {
        id
        leaderId
        name
        createdAt
      }
    }
  ''';

  static const getUsersByClanId = r'''
    query UsersByClanId($clanIdToFind: Int!) {
      usersByClanId(clanIdToFind: $clanIdToFind) {
        id
        name
        lastName
        username
        birthday
        email
        countryId
        cityId
        latitude
        longitude
        isActive
        photoUrl
      }
    }
  ''';
}