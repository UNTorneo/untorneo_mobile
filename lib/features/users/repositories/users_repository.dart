import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untorneo_mobile/core/failure/failure.dart';
import 'package:untorneo_mobile/core/sealed/either.dart';
import 'package:untorneo_mobile/features/users/datasources/users_datasource.dart';
import 'package:untorneo_mobile/features/users/models/users_base_model.dart';
import 'package:untorneo_mobile/features/users/models/users_model.dart';

final usersRepositoryProvider =
    Provider<UsersRepository>(UsersRepositoryImpl.fromRef);

abstract class UsersRepository {
  Future<Either<Failure, List<UserBaseModel>>> getUsers();
  Future<Either<Failure, UserModel>> getUser(
    String userId,
  );
}

class UsersRepositoryImpl implements UsersRepository {
  UsersRepositoryImpl(this.datasource);

  factory UsersRepositoryImpl.fromRef(Ref ref) {
    return UsersRepositoryImpl(
      ref.read(usersDatasourceProvider),
    );
  }
  
  final UsersDatasource datasource;

  @override
  Future<Either<Failure, List<UserBaseModel>>> getUsers() async {
    try {
      final res = await datasource.getUsers();
      return Right(res);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> getUser(
    String userId,
  ) async {
    try {
      final res = await datasource.getUser(userId);
      return Right(res);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

}