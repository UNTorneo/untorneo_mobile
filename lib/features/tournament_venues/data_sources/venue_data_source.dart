import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/client.dart';
import 'package:untorneo_mobile/core/external/db_handler.dart';
import 'package:untorneo_mobile/core/external/gql_handler.dart';
import 'package:untorneo_mobile/core/logger/logger.dart';
import 'package:untorneo_mobile/features/tournament_venues/models/venue_model.dart';
import 'package:untorneo_mobile/features/tournament_venues/queries/venue_queries.dart';

final venueDataSourceProvider = Provider<VenueDataSource>(VenueDataSourceImpl.fromRef);

abstract class VenueDataSource {
  Future<Venue> getVenueById(int venueId);
  Future<List<Venue>> getVenues();
}

class VenueDataSourceImpl implements VenueDataSource {
  VenueDataSourceImpl(this.ref, this.gqlHandler, this.dbHandler);

  factory VenueDataSourceImpl.fromRef(Ref ref) {
    return VenueDataSourceImpl(
      ref,
      ref.read(graphQLProvider),
      ref.read(dbHandlerProvider),
    );
  }

  final GraphQLHandler gqlHandler;
  final DBHandler dbHandler;
  final Ref ref;

  @override
  Future<List<Venue>> getVenues() async {
    try {
      final options = QueryOptions(
        document: gql(VenueQuerys.getVenues),
      );
      final res = await gqlHandler.queryList(options, 'getVenues');
      return List.from(res).map((e) => Venue.fromMap(e)).toList();
    } catch (e, s) {
      Logger.logError(e.toString(), s);
      rethrow;
    }
  }

  @override
  Future<Venue> getVenueById(int id) async {
    try {
      final options = QueryOptions(
        document: gql(VenueQuerys.getVenue),
        variables: {'getVenueId': id},
      );
      final res = await gqlHandler.query(options, 'getVenue');
      return Venue.fromMap(res);
    } catch (e, s) {
      Logger.logError(e.toString(), s);
      rethrow;
    }
  }
}
