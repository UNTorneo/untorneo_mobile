import 'dart:ffi';

import 'package:equatable/equatable.dart';

class UserBaseModel extends Equatable {
  const UserBaseModel({
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
    this.photoUrl,
  });

  factory UserBaseModel.fromJson(Map<String, dynamic> json) => 
    UserBaseModel(
      id: json['id'],
      name: json['name'],
      lastName: json['lastName'],
      username: json['birthday'],
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