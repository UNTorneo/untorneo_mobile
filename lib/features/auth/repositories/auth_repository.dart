import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untorneo_mobile/core/failure/failure.dart';
import 'package:untorneo_mobile/core/sealed/either.dart';
import 'package:untorneo_mobile/features/auth/datasources/auth_datasources.dart';
import 'package:untorneo_mobile/features/auth/models/auth_model.dart';
import 'package:untorneo_mobile/features/auth/models/login_model.dart';

final authRepositoryProvider =
    Provider<AuthRepository>(AuthRepositoryImpl.fromRef);

abstract class AuthRepository {
  Future<Either<Failure, AuthModel>> login(LoginModel loginModel);
}

final class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this.ref, this.authDatasource);

  factory AuthRepositoryImpl.fromRef(Ref ref) {
    return AuthRepositoryImpl(
      ref,
      ref.read(authDatasourceProvider),
    );
  }

  final AuthDatasource authDatasource;
  final Ref ref;

  @override
  Future<Either<Failure, AuthModel>> login(LoginModel loginModel) async {
    try {
      final res = await authDatasource.login(loginModel);
      await authDatasource.saveToken(res.accessToken);
      return Right(res);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
