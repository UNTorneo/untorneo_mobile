import 'package:equatable/equatable.dart';

class CreateTournamentModel extends Equatable {
  const CreateTournamentModel({
    required this.name,
    required this.teams,
    required this.sport,
    required this.mode,
    required this.visibility,
    required this.venue,
    required this.clanId,
  });

  final String name;
  final List<String> teams;
  final String sport;
  final String mode;
  final String visibility;
  final String venue;
  final String clanId;

  Map<String, dynamic> toJson() {
    return {
      'access': visibility,
      'clanId': clanId,
      'modeId': mode,
      'name': name,
      'sportId': sport,
      'status': 'confirmed',
      'teams': teams,
      'venueName': venue,
      'venueId': null,
    };
  }

  @override
  List<Object> get props {
    return [
      name,
      teams,
      sport,
      mode,
      visibility,
      venue,
      clanId,
    ];
  }
}
