final class VenueQuerys {
  static const getVenues = r'''
    query GetVenues {
      getVenues {
        id
        location
        description
        isActive
      }
    }
  ''';

  static const getVenue = r'''
    query GetVenue($getVenueId: Int!) {
      getVenue(id: $getVenueId) {
        id
        location
        description
        isActive
      }
    }
  ''';
}