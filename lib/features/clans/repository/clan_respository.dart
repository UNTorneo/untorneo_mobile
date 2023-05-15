import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untorneo_mobile/core/failure/failure.dart';
import 'package:untorneo_mobile/core/sealed/either.dart';
import 'package:untorneo_mobile/features/clans/data_source/clan_data_source.dart';
import 'package:untorneo_mobile/features/clans/model/clan_model.dart';

final clanRepositoryProvider = Provider<ClanRepository>((ref) {
  return ClanRepositoryImpl.fromRef(ref);
});

abstract class ClanRepository {
  Future<Either<Failure, List<Clan>>> getClans();
  Future<Either<Failure, Clan>> getClanById(id);
}

class ClanRepositoryImpl implements ClanRepository {
  ClanRepositoryImpl(this.ordersDataSource);

  factory ClanRepositoryImpl.fromRef(Ref ref) {
    final venueDataSource = ref.read(clanDataSourceProvider);
    return ClanRepositoryImpl(venueDataSource);
  }

  final ClanDataSource ordersDataSource;
  
  @override
  Future<Either<Failure, Clan>> getClanById(id) async {
    try {
      final res = await ordersDataSource.getClanById(id);
      return Right(res);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, List<Clan>>> getClans() async {
    try {
      final res = await ordersDataSource.getClans();
      return Right(res);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}