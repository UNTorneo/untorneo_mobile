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
  Future<Either<Failure, void>> addVenue(newvenue);
}

class VenueRepositoryImpl implements VenueRepository {
  VenueRepositoryImpl(this.venueDataSource);

  factory VenueRepositoryImpl.fromRef(Ref ref) {
    final venueDataSource = ref.read(venueDataSourceProvider);
    return VenueRepositoryImpl(venueDataSource);
  }

  final VenueDataSource venueDataSource;
  
  @override
  Future<Either<Failure, Venue>> getVenueById(id) async {
    try {
      final res = await venueDataSource.getVenueById(id);
      return Right(res);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, List<Venue>>> getVenues() async {
    try {
      final res = await venueDataSource.getVenues();
      return Right(res);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, void>> addVenue(newVenue) async {
    try {
      final res = await venueDataSource.addVenue(newVenue);
      return Right(res);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}