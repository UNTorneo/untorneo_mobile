import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/client.dart';
import 'package:untorneo_mobile/core/external/db_handler.dart';
import 'package:untorneo_mobile/core/external/gql_handler.dart';
import 'package:untorneo_mobile/core/logger/logger.dart';
import 'package:untorneo_mobile/features/clans/model/clan_model.dart';
import 'package:untorneo_mobile/features/clans/querys/clan_querys.dart';

final clanDataSourceProvider = Provider<ClanDataSource>(ClanDataSourceImpl.fromRef);

abstract class ClanDataSource {
  Future<Clan> getClanById(int venueId);
  Future<List<Clan>> getClans();
}

class ClanDataSourceImpl implements ClanDataSource {
  ClanDataSourceImpl(this.ref, this.gqlHandler, this.dbHandler);

  factory ClanDataSourceImpl.fromRef(Ref ref) {
    return ClanDataSourceImpl(
      ref,
      ref.read(graphQLProvider),
      ref.read(dbHandlerProvider),
    );
  }

  final GraphQLHandler gqlHandler;
  final DBHandler dbHandler;
  final Ref ref;

  @override
  Future<Clan> getClanById(int clanId) async {
    try {
      final options = QueryOptions(
        document: gql(ClanQuerys.clans),
        variables: {'clanByIdId': clanId},
      );
      final res = await gqlHandler.query(options, 'clans');
      return Clan.fromMap(res);
    } catch (e, s) {
      Logger.logError(e.toString(), s);
      rethrow;
    }
  }

  @override
  Future<List<Clan>> getClans() async {
    try {
      final options = QueryOptions(
        document: gql(ClanQuerys.clans),
      );
      final res = await gqlHandler.queryList(options, 'clans');
      return List.from(res).map((e) => Clan.fromJson(e)).toList();
    } catch (e, s) {
      Logger.logError(e.toString(), s);
      rethrow;
    }
  }
}
