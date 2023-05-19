import 'package:equatable/equatable.dart';
import 'package:untorneo_mobile/core/enums/matches_state_enum.dart';

class MatchModel extends Equatable {
  factory MatchModel.fromJson(Map<String, dynamic> map) {
    return MatchModel(
      id: map['id'] as String,
      tournamentId: map['tournamentId']['name'] as String,
      homeTeam: map['homeTeam']['name'] as String,
      visitingTeam: map['visitingTeam']['name'] as String,
      homeTeamScore: map['homeTeamScore'] as int,
      visitingTeamScore: map['visitingTeamScore'] as int,
      date: DateTime.parse(map['date']),
      courtId: map['courtId'] as String,
      status: map['status'] as String,
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
    );
  }
  const MatchModel({
    required this.id,
    required this.tournamentId,
    required this.homeTeam,
    required this.visitingTeam,
    required this.homeTeamScore,
    required this.visitingTeamScore,
    required this.date,
    required this.courtId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  CurrentMatcheState get state => CurrentMatcheState.fromString(status);

  final String id;
  final String tournamentId;
  final String homeTeam;
  final String visitingTeam;
  final int homeTeamScore;
  final int visitingTeamScore;
  final DateTime date;
  final String courtId;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  @override
  List<Object> get props {
    return [
      id,
      tournamentId,
      homeTeam,
      visitingTeam,
      homeTeamScore,
      visitingTeamScore,
      date,
      courtId,
      status,
      createdAt,
      updatedAt,
    ];
  }
}