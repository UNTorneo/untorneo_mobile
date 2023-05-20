import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untorneo_mobile/core/failure/failure.dart';
import 'package:untorneo_mobile/core/sealed/either.dart';
import 'package:untorneo_mobile/features/clans/data_source/clan_data_source.dart';
import 'package:untorneo_mobile/features/clans/model/clan_model.dart';
import 'package:untorneo_mobile/features/users/models/user_model.dart';

final clanRepositoryProvider = Provider<ClanRepository>((ref) {
  return ClanRepositoryImpl.fromRef(ref);
});

abstract class ClanRepository {
  Future<Either<Failure, List<Clan>>> getClans();
  Future<Either<Failure, Clan>> getClanById(id);
  Future<Either<Failure, List<UserModel>>> getUsersByClanId(clanId);
  Future<Either<Failure, void>> createClan(leaderId, name, createdAt);
  Future<Either<Failure, void>> addUserToClan(clanId, userId);
}

class ClanRepositoryImpl implements ClanRepository {
  ClanRepositoryImpl(this.clanDataSource);

  factory ClanRepositoryImpl.fromRef(Ref ref) {
    final clanDataSource = ref.read(clanDataSourceProvider);
    return ClanRepositoryImpl(clanDataSource);
  }

  final ClanDataSource clanDataSource;
  
  @override
  Future<Either<Failure, Clan>> getClanById(id) async {
    try {
      final res = await clanDataSource.getClanById(id);
      return Right(res);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, List<Clan>>> getClans() async {
    try {
      final res = await clanDataSource.getClans();
      return Right(res);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<UserModel>>> getUsersByClanId(clanId) async {
    try {
      final res = await clanDataSource.getUsersByClanId(clanId);
      return Right(res);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, void>> addUserToClan(clanId, userId) async {
    try {
      final res = await clanDataSource.addUserToClan(clanId, userId);
      return Right(res);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, void>> createClan(leaderId, name, createdAt) async {
    try {
      final res = await clanDataSource.createClan(leaderId, name, createdAt);
      return Right(res);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}