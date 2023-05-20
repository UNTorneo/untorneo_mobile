final class UserQuery {
  static const getUsers = r'''
  query Users {
    users {
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
  static const getUser = r'''
    query User($userId: Int!) {
      user(id: $userId) {
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