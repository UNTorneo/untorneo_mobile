import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/client.dart';
import 'package:untorneo_mobile/core/external/gql_handler.dart';
import 'package:untorneo_mobile/core/logger/logger.dart';
import 'package:untorneo_mobile/features/users/gql/users_querys.dart';
import 'package:untorneo_mobile/features/users/models/users_base_model.dart';
import 'package:untorneo_mobile/features/users/models/user_model.dart';

final usersDatasourceProvider =
    Provider<UsersDatasource>(UsersDatasourceImpl.fromRef);


abstract class UsersDatasource {
  Future<List<UserBaseModel>>getUsers();
  Future<UserModel> getUser(
    int userId,
  );
}

class UsersDatasourceImpl implements UsersDatasource {
  const UsersDatasourceImpl(this.gqlHandler, this.ref);

  factory UsersDatasourceImpl.fromRef(Ref ref) {
    return UsersDatasourceImpl(
      ref.read(graphQLProvider),
      ref,
    );
  }

  final GraphQLHandler gqlHandler;
  final Ref ref;

  @override
  Future<List<UserBaseModel>> getUsers() async {
    try {
      final options = QueryOptions(
        document: gql(UserQuery.getUsers),
      );
      final res = await gqlHandler.queryList(options, 'users');
      return List.from(res).map((e) => UserBaseModel.fromJson(e)).toList();
    } catch (e, s) {
      Logger.logError(e.toString(), s);
      rethrow;
    }
  }
  
  @override
  Future<UserModel> getUser(
    int userId,
  ) async {
    try {
      final options = QueryOptions(
        document: gql(UserQuery.getUser),
        variables: {'userId': userId},
      );
      final res = await gqlHandler.query(options, 'user');
      return UserModel.fromJson(res);
    } catch (e, s) {
      Logger.logError(e.toString(), s);
      rethrow;
    }
  }

}