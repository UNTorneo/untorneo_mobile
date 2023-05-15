import 'package:equatable/equatable.dart';

final class LoginModel extends Equatable {
  const LoginModel(this.email, this.password);

  final String email;
  final String password;

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };

  @override
  List<Object?> get props => [email, password];
}
