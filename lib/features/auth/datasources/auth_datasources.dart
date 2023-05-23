import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/client.dart';
import 'package:untorneo_mobile/core/constants/db_constants.dart';
import 'package:untorneo_mobile/core/external/db_handler.dart';
import 'package:untorneo_mobile/core/external/gql_handler.dart';
import 'package:untorneo_mobile/core/logger/logger.dart';
import 'package:untorneo_mobile/features/auth/gql/auth_mutations.dart';
import 'package:untorneo_mobile/features/auth/models/auth_model.dart';
import 'package:untorneo_mobile/features/auth/models/login_model.dart';
import 'package:untorneo_mobile/features/auth/models/user_sign_up_model.dart';

final authDatasourceProvider =
    Provider<AuthDatasource>(AuthDatasourceImpl.fromRef);

abstract class AuthDatasource {
  Future<AuthModel> login(LoginModel loginModel);
  Future<void> saveToken(String token);
  Future<void> addUser(UserSignUpModel newUser);
}

final class AuthDatasourceImpl implements AuthDatasource {
  const AuthDatasourceImpl(this.ref, this.gqlHandler, this.dbHandler);

  factory AuthDatasourceImpl.fromRef(Ref ref) {
    return AuthDatasourceImpl(
      ref,
      ref.read(graphQLProvider),
      ref.read(dbHandlerProvider),
    );
  }

  final GraphQLHandler gqlHandler;
  final DBHandler dbHandler;
  final Ref ref;

  @override
  Future<AuthModel> login(LoginModel loginModel) async {
    try {
      final options = MutationOptions(
        document: gql(AuthMutations.login),
        variables: loginModel.toJson(),
      );
      final res = await gqlHandler.mutate(options, 'login');
      return AuthModel.fromJson(res);
    } catch (e, s) {
      Logger.logError(e.toString(), s);
      rethrow;
    }
  }

  @override
  Future<void> saveToken(String token) async {
    try {
      await dbHandler.put(
        DbConstants.bearerTokenKey,
        token,
        DbConstants.authBox,
      );
      return;
    } catch (e, s) {
      Logger.logError(e.toString(), s);
      rethrow;
    }
  }

  @override
  Future<void> addUser(UserSignUpModel newUser) async {
    try {
      final options = MutationOptions(
        document: gql(AuthMutations.addUser),
        variables: newUser.toMap(),
      );
      final res = await gqlHandler.mutate(options, 'addUser');
      Logger.log(res.toString());
    } catch (e, s) {
      Logger.logError(e.toString(), s);
      rethrow;
    }
  }
}
