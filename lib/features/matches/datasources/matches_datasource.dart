import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/client.dart';
import 'package:untorneo_mobile/core/external/gql_handler.dart';
import 'package:untorneo_mobile/core/logger/logger.dart';
import 'package:untorneo_mobile/features/matches/gql/matches_querys.dart';
import 'package:untorneo_mobile/features/matches/models/matches_model.dart';

final matchesDatasourceProvider =
    Provider<MatchesDatasource>(MatchesDatasourceImpl.fromRef);

abstract class MatchesDatasource {
  Future<List<MatchesModel>> getMatches();
}

class MatchesDatasourceImpl implements MatchesDatasource {
  const MatchesDatasourceImpl(this.gqlHandler, this.ref);

  factory MatchesDatasourceImpl.fromRef(Ref ref) {
    return MatchesDatasourceImpl(
      ref.read(graphQLProvider),
      ref,
    );
  }

  final GraphQLHandler gqlHandler;
  final Ref ref;

  @override
  Future<List<MatchesModel>> getMatches() async {
    try {
      final options = QueryOptions(
        document: gql(MatchesQuerys.getMatches),
      );
      final res = await gqlHandler.queryList(options, 'getMatches');
      return List.from(res).map((e) => MatchesModel.fromJson(e)).toList();
    } catch (e, s) {
      Logger.logError(e.toString(), s);
      rethrow;
    }
  }
}
