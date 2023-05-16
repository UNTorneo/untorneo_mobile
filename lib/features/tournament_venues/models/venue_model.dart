import 'dart:convert';
import 'package:equatable/equatable.dart';

class Venue extends Equatable {

  factory Venue.fromJson(String source) => Venue.fromMap(json.decode(source));

  factory Venue.fromMap(Map<String, dynamic> map) {
    return Venue(
      id: map['id'] as int,
      location: map['location'] as String,
      description: map['description'] as String,
      isActive: map['isActive'] as bool,
    );
  }

  const Venue({
    required this.id,
    required this.location,
    required this.description,
    required this.isActive,
  });

  final int id;
  final String location;
  final String description;
  final bool isActive;
  
  @override
  List<Object?> get props {
    return [
      id,
      location,
      description,
      isActive
    ];
  }

  List<Venue> fromList(Map<String, List> venues) {
    return List<Venue>.from(venues['getVenues']!.map((e) => Venue.fromMap(e)));
  }

  Venue copyWith({
    int? id,
    String? location,
    String? description,
    bool? isActive,
  }) {
    return Venue(
      id: id ?? this.id,
      location: location ?? this.location,
      description: description ?? this.description,
      isActive: isActive ?? this.isActive,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'location' : location,
      'description' : description,
      'isActive' : isActive
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Venue(id: $id, location: $location, description: $description, isActive: $isActive)';
  }
}