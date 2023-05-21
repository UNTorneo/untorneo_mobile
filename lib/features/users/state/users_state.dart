// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:untorneo_mobile/core/sealed/async_state.dart';
import 'package:untorneo_mobile/features/users/models/users_base_model.dart';
import 'package:untorneo_mobile/features/users/models/user_model.dart';

final class UsersState extends Equatable {
  const UsersState({
    required this.users,
    required this.user,
  });

  factory UsersState.initial() {
    return const UsersState(
      users: AsyncState.initial(),
      user: AsyncState.initial(),
    );
  }

  final AsyncState<List<UserBaseModel>> users;
  final AsyncState<UserModel> user;

  @override
  List<Object?> get props => [users];

  UsersState copyWith({
    AsyncState<List<UserBaseModel>>? users,
    AsyncState<UserModel>? user,
  }) {
    return UsersState(
      users: users ?? this.users,
      user: user ?? this.user,
    );
  }
}
