import 'package:equatable/equatable.dart';

final class AuthModel extends Equatable {
  const AuthModel(this.accessToken);

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      json['accessToken'] as String,
    );
  }

  final String accessToken;

  @override
  List<Object?> get props => [accessToken];
}
