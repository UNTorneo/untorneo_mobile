import 'package:equatable/equatable.dart';

import 'package:untorneo_mobile/core/wrappers/async_state.dart';

class AuthState extends Equatable {
  final AsyncState<String> email;

  const AuthState({required this.email});

  factory AuthState.initial() {
    return AuthState(email: AsyncState.initial());
  }

  @override
  List<Object?> get props => [email];

  AuthState copyWith({AsyncState<String>? email}) {
    return AuthState(email: email ?? this.email);
  }
}
