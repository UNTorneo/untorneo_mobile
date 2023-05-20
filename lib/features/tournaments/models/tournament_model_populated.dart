import 'package:equatable/equatable.dart';

class TournamentVenuePopulated extends Equatable {
  const TournamentVenuePopulated({
    required this.id,
    required this.name,
    required this.teams,
    required this.sport,
    required this.mode,
    required this.clan,
    required this.venue,
    required this.venueName,
    required this.access,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TournamentVenuePopulated.fromJson(Map<String, dynamic> json) =>
      TournamentVenuePopulated(
        id: json['id'],
        name: json['name'],
        teams: List<String>.from(json['teams'].map((x) => x['name'])),
        sport: TournamentSport.fromJson(json['sportId']),
        mode: TournamentMode.fromJson(json['modeId']),
        clan: TournamentClan.fromJson(json['clanId']),
        venue: TournamentVenue.fromJson(json['venueId']),
        venueName: json['venueName'],
        access: json['access'],
        status: json['status'],
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
      );

  final String id;
  final String name;
  final List<String> teams;
  final TournamentSport sport;
  final TournamentMode mode;
  final TournamentClan? clan;
  final TournamentVenue? venue;
  final String? venueName;
  final String access;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  TournamentVenuePopulated copyWith({
    String? id,
    String? name,
    List<String>? teams,
    TournamentSport? sport,
    TournamentMode? mode,
    TournamentClan? clan,
    TournamentVenue? venue,
    dynamic venueName,
    String? access,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      TournamentVenuePopulated(
        id: id ?? this.id,
        name: name ?? this.name,
        teams: teams ?? this.teams,
        sport: sport ?? this.sport,
        mode: mode ?? this.mode,
        clan: clan ?? this.clan,
        venue: venue ?? this.venue,
        venueName: venueName ?? this.venueName,
        access: access ?? this.access,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  @override
  List<Object?> get props {
    return [
      id,
      name,
      teams,
      sport,
      mode,
      clan,
      venue,
      venueName,
      access,
      status,
      createdAt,
      updatedAt,
    ];
  }
}

class TournamentClan extends Equatable {
  const TournamentClan({
    required this.id,
    this.leaderId,
    required this.name,
    required this.createdAt,
  });

  factory TournamentClan.fromJson(Map<String, dynamic> json) => TournamentClan(
        id: json['id'],
        leaderId: json['leaderId'],
        name: json['name'],
        createdAt: DateTime.parse(json['createdAt']),
      );

  final int id;
  final String? leaderId;
  final String name;
  final DateTime createdAt;

  TournamentClan copyWith({
    int? id,
    dynamic leaderId,
    String? name,
    DateTime? createdAt,
  }) =>
      TournamentClan(
        id: id ?? this.id,
        leaderId: leaderId ?? this.leaderId,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
      );

  @override
  List<Object?> get props => [id, leaderId, name, createdAt];
}

class TournamentMode extends Equatable {
  const TournamentMode({
    required this.id,
    required this.sportId,
    required this.name,
    required this.winningPoints,
    required this.teamsNumber,
    required this.playersPerTeam,
    required this.description,
    required this.substitutePlayers,
  });

  factory TournamentMode.fromJson(Map<String, dynamic> json) => TournamentMode(
        id: json['_id'],
        sportId: json['sportId'],
        name: json['name'],
        winningPoints: json['winningPoints'],
        teamsNumber: json['teamsNumber'],
        playersPerTeam: json['playersPerTeam'],
        description: json['description'],
        substitutePlayers: json['substitutePlayers'],
      );

  final String id;
  final String sportId;
  final String name;
  final int? winningPoints;
  final int? teamsNumber;
  final int? playersPerTeam;
  final String? description;
  final int? substitutePlayers;

  TournamentMode copyWith({
    String? id,
    String? sportId,
    String? name,
    int? winningPoints,
    int? teamsNumber,
    int? playersPerTeam,
    String? description,
    int? substitutePlayers,
  }) =>
      TournamentMode(
        id: id ?? this.id,
        sportId: sportId ?? this.sportId,
        name: name ?? this.name,
        winningPoints: winningPoints ?? this.winningPoints,
        teamsNumber: teamsNumber ?? this.teamsNumber,
        playersPerTeam: playersPerTeam ?? this.playersPerTeam,
        description: description ?? this.description,
        substitutePlayers: substitutePlayers ?? this.substitutePlayers,
      );

  @override
  List<Object?> get props {
    return [
      id,
      sportId,
      name,
      winningPoints,
      teamsNumber,
      playersPerTeam,
      description,
      substitutePlayers,
    ];
  }
}

class TournamentSport extends Equatable {
  const TournamentSport({
    required this.id,
    required this.name,
    required this.modes,
    required this.description,
    required this.recommendation,
  });

  factory TournamentSport.fromJson(Map<String, dynamic> json) =>
      TournamentSport(
        id: json['_id'],
        name: json['name'],
        modes: json['modes'] == null
            ? null
            : List<String>.from(json['modes'].map((x) => x)),
        description: json['description'],
        recommendation: json['recommendation'] == null
            ? null
            : List<String>.from(json['recommendation'].map((x) => x)),
      );

  final String id;
  final String name;
  final List<String>? modes;
  final String description;
  final List<String>? recommendation;

  TournamentSport copyWith({
    String? id,
    String? name,
    List<String>? modes,
    String? description,
    List<String>? recommendation,
  }) =>
      TournamentSport(
        id: id ?? this.id,
        name: name ?? this.name,
        modes: modes ?? this.modes,
        description: description ?? this.description,
        recommendation: recommendation ?? this.recommendation,
      );

  @override
  List<Object?> get props {
    return [
      id,
      name,
      modes,
      description,
      recommendation,
    ];
  }
}

class TournamentVenue extends Equatable {
  const TournamentVenue({
    required this.id,
    required this.location,
    required this.description,
    required this.isActive,
  });

  factory TournamentVenue.fromJson(Map<String, dynamic> json) =>
      TournamentVenue(
        id: json['id'],
        location: json['location'],
        description: json['description'],
        isActive: json['isActive'],
      );

  final int id;
  final String location;
  final String description;
  final bool isActive;

  TournamentVenue copyWith({
    int? id,
    String? location,
    String? description,
    bool? isActive,
  }) =>
      TournamentVenue(
        id: id ?? this.id,
        location: location ?? this.location,
        description: description ?? this.description,
        isActive: isActive ?? this.isActive,
      );

  @override
  List<Object> get props => [id, location, description, isActive];
}
