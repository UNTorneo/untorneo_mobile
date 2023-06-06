final class PostQuerys {
  static const getConsumerPost = r'''
    query GetConsumerPost() {
      getConsumerPost {
        postId
        ownerId
        location
        description
      }
    }
  ''';
}