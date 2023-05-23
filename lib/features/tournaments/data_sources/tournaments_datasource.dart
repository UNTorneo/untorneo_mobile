import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/client.dart';
import 'package:untorneo_mobile/core/external/gql_handler.dart';
import 'package:untorneo_mobile/core/logger/logger.dart';
import 'package:untorneo_mobile/features/tournaments/gql/tournaments_mutation.dart';
import 'package:untorneo_mobile/features/tournaments/gql/tournaments_query.dart';
import 'package:untorneo_mobile/features/tournaments/models/create_tournament_model.dart';
import 'package:untorneo_mobile/features/tournaments/models/tournament_model.dart';
import 'package:untorneo_mobile/features/tournaments/models/tournament_model_populated.dart';

final tournametsDatasourceProvider =
    Provider<TournamentsDatasource>(TournamentsDatasourceImpl.fromRef);

abstract class TournamentsDatasource {
  Future<void> createTournament(CreateTournamentModel createTournament);
  Future<List<TournamentModel>> getTournaments();
  Future<TournamentVenuePopulated> getTournamentVenuePopulated(
    String tournamentId,
  );
}

class TournamentsDatasourceImpl implements TournamentsDatasource {
  const TournamentsDatasourceImpl(this.gqlHandler, this.ref);

  factory TournamentsDatasourceImpl.fromRef(Ref ref) {
    return TournamentsDatasourceImpl(
      ref.read(graphQLProvider),
      ref,
    );
  }

  final GraphQLHandler gqlHandler;
  final Ref ref;

  @override
  Future<List<TournamentModel>> getTournaments() async {
    try {
      final options = QueryOptions(
        document: gql(TournamentQuery.getTournaments),
      );
      final res = await gqlHandler.queryList(options, 'getTournaments');
      return List.from(res).map((e) => TournamentModel.fromJson(e)).toList();
    } catch (e, s) {
      Logger.logError(e.toString(), s);
      rethrow;
    }
  }

  @override
  Future<TournamentVenuePopulated> getTournamentVenuePopulated(
    String tournamentId,
  ) async {
    try {
      final options = QueryOptions(
        document: gql(TournamentQuery.getTournamentById),
        variables: {'getTournamentId': tournamentId},
      );
      final res = await gqlHandler.query(options, 'getTournament');
      return TournamentVenuePopulated.fromJson(res);
    } catch (e, s) {
      Logger.logError(e.toString(), s);
      rethrow;
    }
  }

  @override
  Future<void> createTournament(CreateTournamentModel createTournament) async {
    try {
      final options = MutationOptions(
        document: gql(TournamentMutation.createTournament),
        variables: {'tournament': createTournament.toJson()},
      );
      await gqlHandler.mutate(options, 'addTournament');
    } catch (e, s) {
      Logger.logError(e.toString(), s);
      rethrow;
    }
  }
}
