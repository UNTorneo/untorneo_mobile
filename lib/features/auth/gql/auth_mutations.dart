final class AuthMutations {
  static const addUser = r'''
    mutation AddUser($name: String!, $lastName: String!, $username: String!, $birthday: String!, $email: String!, $password: String!, $countryId: Int!, $cityId: Int!, $latitude: Float!, $longitude: Float!, $photoUrl: String) {
      addUser(name: $name, lastName: $lastName, username: $username, birthday: $birthday, email: $email, password: $password, countryId: $countryId, cityId: $cityId, latitude: $latitude, longitude: $longitude, photoUrl: $photoUrl) {
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
        }
        ... on ErrorResponse {
          error
        }
      }
    }
  ''';
}
