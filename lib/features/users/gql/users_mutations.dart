final class UserMutations {
  static const updateUser = r'''
    mutation UpdateUser($updateUserId: Int!, $name: String, $lastName: String, $username: String, $birthday: String, $email: String, $password: String, $countryId: Int, $cityId: Int, $latitude: Float, $longitude: Float, $photoUrl: String) {
      updateUser(id: $updateUserId, name: $name, lastName: $lastName, username: $username, birthday: $birthday, email: $email, password: $password, countryId: $countryId, cityId: $cityId, latitude: $latitude, longitude: $longitude, photoUrl: $photoUrl) {
        ... on SucessResponse {
          message
        }
        ... on ErrorResponse {
          error
        }
      }
    }
  ''';
}
