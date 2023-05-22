import 'package:equatable/equatable.dart';

class SportModeModel extends Equatable {
  const SportModeModel({
    required this.id,
    required this.name,
    required this.description,
    required this.sportId,
    this.winningPoints,
    this.teamsNumber,
    this.playersPerTeam,
    this.substitutePlayers, 
  });

  factory SportModeModel.fromJson(Map<String, dynamic> map) {
    return SportModeModel(
      id: map['_id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      sportId: map['sportId'] as String,
      winningPoints: map['winningPoints'] as int?,
      teamsNumber: map['teamsNumber'] as int?,
      playersPerTeam: map['playersPerTeam'] as int?,
      substitutePlayers: map['substitutePlayers'] as int?,
    );
  }

  final String id;
  final String description;
  final String name;
  final String sportId;
  final int? winningPoints;
  final int? teamsNumber;
  final int? playersPerTeam;
  final int? substitutePlayers;

  @override
  List<Object?> get props {
    return [
      id,
      description,
      name,
      sportId,
      winningPoints,
      teamsNumber,
      playersPerTeam,
      substitutePlayers,
    ];
  }
}
