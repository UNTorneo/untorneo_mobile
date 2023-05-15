import 'package:equatable/equatable.dart';
import 'package:untorneo_mobile/core/sealed/async_state.dart';
import 'package:untorneo_mobile/features/auth/models/auth_model.dart';

final class AuthState extends Equatable {
  const AuthState({required this.authModel});

  factory AuthState.initial() {
    return const AuthState(
      authModel: AsyncInitial(),
    );
  }
  final AsyncState<AuthModel> authModel;

  @override
  List<Object?> get props => [authModel];

  AuthState copyWith({
    AsyncState<AuthModel>? authModel,
  }) {
    return AuthState(
      authModel: authModel ?? this.authModel,
    );
  }
}
