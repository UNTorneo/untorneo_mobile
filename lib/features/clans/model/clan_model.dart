import 'dart:convert';
import 'package:equatable/equatable.dart';

class Clan extends Equatable {
  factory Clan.fromJson(String source) => Clan.fromMap(json.decode(source));

  factory Clan.fromMap(Map<String, dynamic> map) {
    return Clan(
      id: map['id'],
      leaderId: map['leaderId'],
      name: map['name'],
      createdAt: map['createdAt'],
    );
  }

  const Clan({
    required this.id,
    required this.leaderId,
    required this.name,
    required this.createdAt,
  });

  final int id;
  final int leaderId;
  final String name;
  final String createdAt;
  
  @override
  List<Object?> get props {
    return [
      id,
      leaderId,
      name,
      createdAt
    ];
  }
}