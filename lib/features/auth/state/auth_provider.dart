import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untorneo_mobile/core/sealed/async_state.dart';
import 'package:untorneo_mobile/core/sealed/either.dart';
import 'package:untorneo_mobile/features/auth/models/login_model.dart';
import 'package:untorneo_mobile/features/auth/models/user_sign_up_model.dart';
import 'package:untorneo_mobile/features/auth/repositories/auth_repository.dart';
import 'package:untorneo_mobile/features/auth/state/auth_state.dart';

final authProvider =
    StateNotifierProvider<AuthNotifier, AuthState>(AuthNotifier.fromRef);

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier(this.ref, this.authRepository) : super(AuthState.initial());

  factory AuthNotifier.fromRef(Ref ref) {
    return AuthNotifier(ref, ref.read(authRepositoryProvider));
  }

  final Ref ref;
  final AuthRepository authRepository;

  Future<void> login(LoginModel loginModel) async {
    state = state.copyWith(authModel: const AsyncState.loading());
    final res = await authRepository.login(loginModel);
    state = res.fold(
      (l) => state.copyWith(authModel: AsyncState.error(l)),
      (r) => state.copyWith(authModel: AsyncState.success(r)),
    );
  }

  Future<void> addUser(UserSignUpModel newUser,) async {
    final result = await authRepository.addUser(newUser,);
    result.fold(
      (l) => (failure) => state = state.copyWith(
            users: AsyncState.error(failure),
          ),
      (r) => null,
    );
  }

}
