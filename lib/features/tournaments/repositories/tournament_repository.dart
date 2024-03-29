import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untorneo_mobile/core/failure/failure.dart';
import 'package:untorneo_mobile/core/sealed/either.dart';
import 'package:untorneo_mobile/features/tournaments/data_sources/tournaments_datasource.dart';
import 'package:untorneo_mobile/features/tournaments/models/create_tournament_model.dart';
import 'package:untorneo_mobile/features/tournaments/models/tournament_model.dart';
import 'package:untorneo_mobile/features/tournaments/models/tournament_model_populated.dart';

final tournamentRepositoryProvider =
    Provider<TournamentRepository>(TournamentRepositoryImpl.fromRef);

abstract class TournamentRepository {
  Future<Failure?> createTournament(CreateTournamentModel createTournament);
  Future<Either<Failure, List<TournamentModel>>> getTournaments();
  Future<Either<Failure, TournamentVenuePopulated>> getTournamentVenuePopulated(
    String tournamentId,
  );
}

class TournamentRepositoryImpl implements TournamentRepository {
  TournamentRepositoryImpl(this.datasource);

  factory TournamentRepositoryImpl.fromRef(Ref ref) {
    return TournamentRepositoryImpl(
      ref.read(tournametsDatasourceProvider),
    );
  }

  final TournamentsDatasource datasource;

  @override
  Future<Either<Failure, List<TournamentModel>>> getTournaments() async {
    try {
      final res = await datasource.getTournaments();
      return Right(res);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, TournamentVenuePopulated>> getTournamentVenuePopulated(
    String tournamentId,
  ) async {
    try {
      final res = await datasource.getTournamentVenuePopulated(tournamentId);
      return Right(res);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Failure?> createTournament(
    CreateTournamentModel createTournament,
  ) async {
    try {
      await datasource.createTournament(createTournament);
      return null;
    } catch (e) {
      return Failure(e.toString());
    }
  }
}
