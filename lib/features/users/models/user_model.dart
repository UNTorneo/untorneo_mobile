import 'package:equatable/equatable.dart';

final class UserModel extends Equatable {
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
    this.photoUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      name: map['name'] as String,
      lastName: map['lastName'] as String,
      username: map['username'] as String,
      birthday: map['birthday'] as String,
      email: map['email'] as String,
      countryId: map['countryId'] as int,
      cityId: map['cityId'] as int,
      latitude: map['latitude'] as int,
      longitude: map['longitude'] as int,
      isActive: map['isActive'] as bool,
      photoUrl: map['photoUrl'] != null ? map['photoUrl'] as String : null,
    );
  }

  final int id;
  final String name;
  final String lastName;
  final String username;
  final String birthday;
  final String email;
  final int countryId;
  final int cityId;
  final int latitude;
  final int longitude;
  final bool isActive;
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

  @override
  bool get stringify => true;
}
