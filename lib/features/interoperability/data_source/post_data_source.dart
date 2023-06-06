import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/client.dart';
import 'package:untorneo_mobile/core/external/db_handler.dart';
import 'package:untorneo_mobile/core/external/gql_handler.dart';
import 'package:untorneo_mobile/core/logger/logger.dart';
import 'package:untorneo_mobile/features/interoperability/model/post_model.dart';
import 'package:untorneo_mobile/features/interoperability/querys/post_querys.dart';

final postDataSourceProvider = Provider<PostDataSource>(PostDataSourceImpl.fromRef);

abstract class PostDataSource {
  Future<Post> getConsumerPost();
}

class PostDataSourceImpl implements PostDataSource {
  PostDataSourceImpl(this.ref, this.gqlHandler, this.dbHandler);

  factory PostDataSourceImpl.fromRef(Ref ref) {
    return PostDataSourceImpl(
      ref,
      ref.read(graphQLProvider),
      ref.read(dbHandlerProvider),
    );
  }

  final GraphQLHandler gqlHandler;
  final DBHandler dbHandler;
  final Ref ref;
  
  @override
  Future<Post> getConsumerPost() async {
    try {
      final options = QueryOptions(
        document: gql(PostQuerys.getConsumerPost),
      );
      final res = await gqlHandler.query(options, 'getConsumerPost');
      return Post.fromMap(res);
    } catch (e, s) {
      Logger.logError(e.toString(), s);
      rethrow;
    }
  }
}