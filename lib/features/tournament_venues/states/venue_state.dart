import 'package:equatable/equatable.dart';
import 'package:untorneo_mobile/core/sealed/async_state.dart';
import 'package:untorneo_mobile/features/tournament_venues/models/venue_model.dart';

class VenueState extends Equatable {
  const VenueState({
    required this.venueById,
    required this.venues,
  });

  factory VenueState.initial() {
    return const VenueState(
      venueById: AsyncState.initial(),
      venues: AsyncState.initial(),
    );
  }

  final AsyncState<Venue> venueById;
  final AsyncState<List<Venue>> venues;

  VenueState copyWith({AsyncState<Venue>? venueById, AsyncState<List<Venue>>? venues}) {
    return VenueState(
      venueById: venueById ?? this.venueById,
      venues: venues ?? this.venues,
    );
  }

  @override
  List<Object?> get props => [venueById, venues];
}
