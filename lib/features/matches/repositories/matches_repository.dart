import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untorneo_mobile/core/failure/failure.dart';
import 'package:untorneo_mobile/core/sealed/either.dart';
import 'package:untorneo_mobile/features/matches/datasources/matches_datasource.dart';
import 'package:untorneo_mobile/features/matches/models/matches_model.dart';

final matchesRepositoryProvider =
    Provider<MatchesRepository>(MatchesRepositoryImpl.fromRef);

abstract class MatchesRepository {
  Future<Either<Failure, List<MatchesModel>>> getMatches();
}

class MatchesRepositoryImpl implements MatchesRepository {
  MatchesRepositoryImpl(this.datasource);

  factory MatchesRepositoryImpl.fromRef(Ref ref) {
    return MatchesRepositoryImpl(ref.read(matchesDatasourceProvider));
  }

  final MatchesDatasource datasource;

  @override
  Future<Either<Failure, List<MatchesModel>>> getMatches() async {
    try {
      final res = await datasource.getMatches();
      return Right(res);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
