import 'package:equatable/equatable.dart';
import 'package:untorneo_mobile/core/sealed/async_state.dart';
import 'package:untorneo_mobile/features/auth/models/auth_model.dart';
import 'package:untorneo_mobile/features/auth/models/user_sign_up_model.dart';

final class AuthState extends Equatable {
  const AuthState({
    required this.authModel,
    required this.users,
  });

  factory AuthState.initial() {
    return const AuthState(
      authModel: AsyncInitial(),
      users: AsyncInitial(),
    );
  }
  final AsyncState<AuthModel> authModel;
  final AsyncState<List<UserSignUpModel>> users;

  AuthState copyWith({
    AsyncState<AuthModel>? authModel,
    AsyncState<List<UserSignUpModel>>? users,
  }) {
    return AuthState(
      authModel: authModel ?? this.authModel,
      users: users ?? this.users,
    );
  }
  
  @override
  List<Object?> get props {
    return[
      authModel,
      users,
    ];
  }

}
