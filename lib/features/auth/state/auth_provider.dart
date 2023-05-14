import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untorneo_mobile/core/sealed/async_state.dart';
import 'package:untorneo_mobile/features/auth/state/auth_state.dart';

final authProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) => AuthNotifier());

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState.initial());

  void setEmail(String email) {
    state = state.copyWith(email: AsyncState.loading());
    print(state);
    state = state.copyWith(email: AsyncState.success(email));
    print(state);
  }
}
