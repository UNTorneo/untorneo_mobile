import 'package:equatable/equatable.dart';

final class MatchesModel extends Equatable {
  const MatchesModel(
    this.id,
    this.tournamentId,
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
      map['tournamentId'] as String,
      map['homeTeam'] as String,
      map['visitingTeam'] as String,
      map['homeTeamScore'] as int,
      map['visitingTeamScore'] as int,
      map['date'] as String,
      map['courtId'] as String,
      map['status'] as String,
      map['createdAt'] as String,
      map['updatedAt'] as String,
    );
  }

  final String id;
  final String tournamentId;
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
