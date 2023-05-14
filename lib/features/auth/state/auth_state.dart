import 'package:equatable/equatable.dart';

import 'package:untorneo_mobile/core/sealed/async_state.dart';

class AuthState extends Equatable {

  const AuthState({required this.email});

  factory AuthState.initial() {
    return AuthState(email: AsyncState.initial());
  }
  final AsyncState<String> email;

  @override
  List<Object?> get props => [email];

  AuthState copyWith({AsyncState<String>? email}) {
    return AuthState(email: email ?? this.email);
  }
}
