final class VenueMutations {

  static const addVenue = r'''
    mutation AddVenue($venue: AddVenue) {
      addVenue(venue: $venue) {
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