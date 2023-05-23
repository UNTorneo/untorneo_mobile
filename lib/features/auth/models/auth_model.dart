import 'package:equatable/equatable.dart';
import 'package:untorneo_mobile/features/users/models/user_model.dart';

final class AuthModel extends Equatable {
  const AuthModel(this.accessToken, this.user);

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      json['accessToken'] as String,
      UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );
  }

  final String accessToken;
  final UserModel user;

  @override
  List<Object?> get props => [accessToken, user];

  

}
