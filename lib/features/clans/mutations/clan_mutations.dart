final class ClanMutations {
  static const createClan = r'''
    mutation Mutation($leaderId: Int!, $name: String!, $createdAt: String!) {
      createClan(leaderId: $leaderId, name: $name, createdAt: $createdAt) {
        ... on SucessResponse {
          message
        }
        ... on ErrorResponse {
          error
        }
      }
    }
  ''';

  static const deleteClan = r'''
    mutation DeleteClan($deleteClanId: Int!) {
      deleteClan(id: $deleteClanId) {
        ... on SucessResponse {
          message
        }
        ... on ErrorResponse {
          error
        }
      }
    }
  ''';

  static const addUserToClan = r'''
    mutation AddUserToClan($clanId: Int!, $userId: Int!) {
      addUserToClan(clanId: $clanId, userId: $userId) {
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