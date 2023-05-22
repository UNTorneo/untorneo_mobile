import 'package:equatable/equatable.dart';

final class UserSignUpModel extends Equatable {
  const UserSignUpModel({
    required this.name,
    required this.lastName,
    required this.username,
    required this.birthday,
    required this.email,
    required this.countryId,
    required this.cityId,
    required this.latitude,
    required this.longitude,
    this.photoUrl,
  });

  factory UserSignUpModel.fromJson(Map<String, dynamic> map) {
    return UserSignUpModel(
      name: map['name'] as String,
      lastName: map['lastName'] as String,
      username: map['username'] as String,
      birthday: map['birthday'] as String,
      email: map['email'] as String,
      countryId: map['countryId'] as int,
      cityId: map['cityId'] as int,
      latitude: map['latitude'] as int,
      longitude: map['longitude'] as int,
      photoUrl: map['photoUrl'] != null ? map['photoUrl'] as String : null,
    );
  }

  final String name;
  final String lastName;
  final String username;
  final String birthday;
  final String email;
  final int countryId;
  final int cityId;
  final int latitude;
  final int longitude;
  final String? photoUrl;

  @override
  List<Object?> get props {
    return [
      name,
      lastName,
      username,
      birthday,
      email,
      countryId,
      cityId,
      latitude,
      longitude,
      photoUrl,
    ];
  }

  @override
  bool get stringify => true;
}
