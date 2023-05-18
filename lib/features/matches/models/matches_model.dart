import 'package:equatable/equatable.dart';
import 'package:untorneo_mobile/core/enums/matches_state_enum.dart';

final class MatchesModel extends Equatable {
  const MatchesModel(
    this.id,
    this.tournamentName,
    this.homeTeam,
    this.visitingTeam,
    this.homeTeamScore,
    this.visitingTeamScore,
    this.date,
    this.courtId,
    this.status,
    this.createdAt,
    this.updatedAt,
  );

  factory MatchesModel.fromJson(Map<String, dynamic> map) {
    return MatchesModel(
      map['id'] as String,
      map['tournamentId']['name'] as String,
      map['homeTeam']['name'] as String,
      map['visitingTeam']['name'] as String,
      map['homeTeamScore'] as int,
      map['visitingTeamScore'] as int,
      map['date'] as String,
      map['courtId'] as String,
      map['status'] as String,
      map['createdAt'] as String,
      map['updatedAt'] as String,
    );
  }

  CurrentMatcheState get state => CurrentMatcheState.fromString(status);

  final String id;
  final String tournamentName;
  final String homeTeam;
  final String visitingTeam;
  final int homeTeamScore;
  final int visitingTeamScore;
  final String date;
  final String courtId;
  final String status;
  final String createdAt;
  final String updatedAt;

  @override
  List<Object> get props {
    return [
      id,
      tournamentName,
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
