import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untorneo_mobile/core/sealed/async_state.dart';
import 'package:untorneo_mobile/core/sealed/either.dart';
import 'package:untorneo_mobile/features/users/repositories/users_repository.dart';
import 'package:untorneo_mobile/features/users/state/users_state.dart';

final usersProvider = StateNotifierProvider<UsersNotifier, UsersState>(
  UsersNotifier.fromRef,
);

class UsersNotifier extends StateNotifier<UsersState> {
  UsersNotifier(this.usersRepository) : super(UsersState.initial());

  factory UsersNotifier.fromRef(Ref ref) {
    return UsersNotifier(ref.read(usersRepositoryProvider));
  }

  final UsersRepository usersRepository;

  Future<void> getUsers() async {
    state = state.copyWith(users: const AsyncState.loading());
    final res = await usersRepository.getUsers();
    res.fold(
      (l) => state = state.copyWith(users: AsyncState.error(l)),
      (r) => state = state.copyWith(users: AsyncState.success(r)),
    );
  }

  Future<void> getUser(int id) async {
    state = state.copyWith(user: const AsyncState.loading());
    final res = await usersRepository.getUser(id);
    res.fold(
      (l) => state = state.copyWith(user: AsyncState.error(l)),
      (r) => state = state.copyWith(user: AsyncState.success(r)),
    );
  }
}
