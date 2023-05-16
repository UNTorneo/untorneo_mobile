final class AuthMutations {
  static const addUser = r'''
    mutation AddUser($username: String!, $birthday: String!, $email: String!, $password: String!, $countryId: Int!, $cityId: Int!, $latitude: Float!, $longitude: Float!) {
      addUser(username: $username, birthday: $birthday, email: $email, password: $password, countryId: $countryId, cityId: $cityId, latitude: $latitude, longitude: $longitude) {
        ... on SucessResponse {
          message
        }
        ... on ErrorResponse {
          error
        }
      }
    }
    ''';
  static const login = r'''
    mutation Login($email: String!, $password: String!) {
    login(email: $email, password: $password) {
      ... on RequestToken {
        accessToken
        user {
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
      ... on ErrorResponse {
        error
      }
    }
  }
  ''';
}
