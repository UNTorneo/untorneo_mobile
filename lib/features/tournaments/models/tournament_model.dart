import 'package:equatable/equatable.dart';
import 'package:untorneo_mobile/core/enums/tournament_state_enum.dart';

final class TournamentModel extends Equatable {
  const TournamentModel({
    required this.id,
    required this.name,
    required this.access,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.venueName,
  });

  factory TournamentModel.fromJson(Map<String, dynamic> json) {
    return TournamentModel(
      id: json['id'] as String,
      name: json['name'] as String,
      venueName: json['venueName'] as String?,
      access: json['access'] as String,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  final String id;
  final String name;
  final String? venueName;
  final String access;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  CurrentTournamentState? get tournamentState =>
      CurrentTournamentState.fromString(status);

  @override
  List<Object?> get props => [
        id,
        name,
        venueName,
        access,
        status,
        createdAt,
        updatedAt,
      ];
}
