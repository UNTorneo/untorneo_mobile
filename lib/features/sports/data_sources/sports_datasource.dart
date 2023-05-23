import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/client.dart';
import 'package:untorneo_mobile/core/external/gql_handler.dart';
import 'package:untorneo_mobile/core/logger/logger.dart';
import 'package:untorneo_mobile/features/sports/gql/sports_query.dart';
import 'package:untorneo_mobile/features/sports/models/sport_mode_model.dart';
import 'package:untorneo_mobile/features/sports/models/sport_model.dart';

final sportsDatasourceProvider =
    Provider<SportsDatasource>(SportsDatasourceImpl.fromRef);

abstract class SportsDatasource {
  Future<List<SportModel>> getSports();
  Future<SportModeModel> getSportMode(String id);
}

class SportsDatasourceImpl implements SportsDatasource {
  const SportsDatasourceImpl(this.gqlHandler, this.ref);

  factory SportsDatasourceImpl.fromRef(Ref ref) {
    return SportsDatasourceImpl(
      ref.read(graphQLProvider),
      ref,
    );
  }

  final GraphQLHandler gqlHandler;
  final Ref ref;

  @override
  Future<List<SportModel>> getSports() async {
    try {
      final options = QueryOptions(
        document: gql(SportsQuery.getSports),
      );
      final res = await gqlHandler.queryList(options, 'sports');
      return List.from(res).map((e) => SportModel.fromJson(e)).toList();
    } catch (e, s) {
      Logger.logError(e.toString(), s);
      rethrow;
    }
  }

  @override
  Future<SportModeModel> getSportMode(String id) async {
    try {
      final options = QueryOptions(
        document: gql(SportsQuery.getSportMode),
        variables: {'modeId': id},
      );
      final res = await gqlHandler.query(options, 'mode');
      return SportModeModel.fromJson(res);
    } catch (e, s) {
      Logger.logError(e.toString(), s);
      rethrow;
    }
  }
}
