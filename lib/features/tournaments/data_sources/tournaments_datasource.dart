import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/client.dart';
import 'package:untorneo_mobile/core/external/gql_handler.dart';
import 'package:untorneo_mobile/core/logger/logger.dart';
import 'package:untorneo_mobile/features/tournaments/gql/tournaments_query.dart';
import 'package:untorneo_mobile/features/tournaments/models/tournament_model.dart';

final tournametsDatasourceProvider =
    Provider<TournamentsDatasource>(TournamentsDatasourceImpl.fromRef);

abstract class TournamentsDatasource {
  Future<List<TournamentModel>> getTournaments();
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
}
