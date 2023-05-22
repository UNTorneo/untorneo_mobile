import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untorneo_mobile/core/failure/failure.dart';
import 'package:untorneo_mobile/core/sealed/either.dart';
import 'package:untorneo_mobile/features/sports/data_sources/sports_datasource.dart';
import 'package:untorneo_mobile/features/sports/models/sport_mode_model.dart';
import 'package:untorneo_mobile/features/sports/models/sport_model.dart';

final sportsRepositoryProvider =
    Provider<SportRepository>(SportRepositoryImpl.fromRef);

abstract class SportRepository {
  Future<Either<Failure, List<SportModel>>> getSports();
  Future<Either<Failure, List<SportModeModel>>> getSportMode(SportModel sport);
}

class SportRepositoryImpl implements SportRepository {
  SportRepositoryImpl(this.datasource);

  factory SportRepositoryImpl.fromRef(Ref ref) {
    return SportRepositoryImpl(
      ref.read(sportsDatasourceProvider),
    );
  }

  final SportsDatasource datasource;

  @override
  Future<Either<Failure, List<SportModel>>> getSports() async {
    try {
      final res = await datasource.getSports();
      return Right(res);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<SportModeModel>>> getSportMode(
    SportModel sport,
  ) async {
    try {
      if (sport.modes == null || sport.modes!.isEmpty) return const Right([]);
      final responses = await Future.wait(
        sport.modes!.map((e) => datasource.getSportMode(e)),
      );
      return Right(responses);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
