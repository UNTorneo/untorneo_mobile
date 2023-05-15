import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untorneo_mobile/core/sealed/either.dart';
import 'package:untorneo_mobile/core/failure/failure.dart';
import 'package:untorneo_mobile/features/tournament_venues/data_sources/venue_data_source.dart';
import 'package:untorneo_mobile/features/tournament_venues/models/venue_model.dart';

final venueRepositoryProvider = Provider<VenueRepository>((ref) {
  return VenueRepositoryImpl.fromRef(ref);
});

abstract class VenueRepository {
  Future<Either<Failure, List<Venue>>> getVenues();
  Future<Either<Failure, Venue>> getVenueById(id);
}

class VenueRepositoryImpl implements VenueRepository {
  VenueRepositoryImpl(this.ordersDataSource);

  factory VenueRepositoryImpl.fromRef(Ref ref) {
    final venueDataSource = ref.read(venueDataSourceProvider);
    return VenueRepositoryImpl(venueDataSource);
  }

  final VenueDataSource ordersDataSource;
  
  @override
  Future<Either<Failure, Venue>> getVenueById(id) async {
    try {
      final res = await ordersDataSource.getVenueById(id);
      return Right(res);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, List<Venue>>> getVenues() async {
    try {
      final res = await ordersDataSource.getVenues();
      return Right(res);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}