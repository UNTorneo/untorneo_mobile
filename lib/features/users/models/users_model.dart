import 'dart:ffi';

import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  const UserModel({
    required this.id,
    required this.name, 
    required this.lastName, 
    required this.username, 
    required this.birthday, 
    required this.email, 
    required this.countryId, 
    required this.cityId, 
    required this.latitude,
    required this.longitude,
    required this.isActive,
    required this.photoUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
    UserModel(
      id: json['id'],
      name: json['name'],
      lastName: json['lastName'],
      username: json['username'],
      birthday: DateTime.parse(json['birthday']),
      email: json['email'],
      countryId: json['countryId'],
      cityId: json['cityId'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      isActive: json['isActive'],
      photoUrl: json['photoUrl'],
    );
  
  final int id;
  final String name;
  final String lastName;
  final String username;
  final DateTime birthday;
  final String email;
  final int countryId;
  final int cityId;
  final Float latitude;
  final Float longitude;
  final Bool isActive;
  final String? photoUrl;

  UserModel copyWith({
    int? id,
    String? name,
    String? lastName,
    String? username,
    DateTime? birthday,
    String? email,
    int? countryId,
    int? cityId,
    Float? latitude,
    Float? longitude,
    Bool? isActive,
    String? photoUrl,
  }) =>
      UserModel(
        id: id ?? this.id,
        name: name ?? this.name,
        lastName: lastName ?? this.lastName,
        username: username ?? this.username,
        birthday: birthday ?? this.birthday,
        email: email ?? this.email,
        countryId: countryId ?? this.countryId,
        cityId: cityId ?? this.cityId,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        isActive: isActive ?? this.isActive,
        photoUrl: photoUrl ?? this.photoUrl,
      );

  @override
  List<Object?> get props {
    return [
      id,
      name,
      lastName,
      username,
      birthday,
      email,
      countryId,
      cityId,
      latitude,
      longitude,
      isActive,
      photoUrl,
    ];
  }
}
