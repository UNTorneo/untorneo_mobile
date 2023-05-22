import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untorneo_mobile/core/external/gql_handler.dart';
import 'package:untorneo_mobile/core/sealed/async_state.dart';
import 'package:untorneo_mobile/core/sealed/either.dart';
import 'package:untorneo_mobile/features/auth/state/auth_provider.dart';
import 'package:untorneo_mobile/features/clans/repository/clan_respository.dart';
import 'package:untorneo_mobile/features/clans/states/clan_state.dart';

final graphQLProvider = Provider<GraphQLHandler>(GraphQLHandler.fromRef);

final clanProvider = StateNotifierProvider<ClanProvider, ClanState>((ref) {
  return ClanProvider.fromRead(ref);
});

class ClanProvider extends StateNotifier<ClanState> {
  ClanProvider({
    required this.clanRepository,
    required this.ref,
  }) : super(
          const ClanState(
              clanById: AsyncState.initial(),
              clans: AsyncState.initial(),
              userAdded: AsyncState.initial(),
              users: AsyncState.initial()),
        );

  factory ClanProvider.fromRead(Ref ref) {
    final clanRepository = ref.read(clanRepositoryProvider);
    return ClanProvider(
      ref: ref,
      clanRepository: clanRepository,
    );
  }

  final Ref ref;
  final ClanRepository clanRepository;

  Future<void> getClanById({required int id}) async {
    if (id <= 0) return;
    state = state.copyWith(
      clanById: const AsyncState.loading(),
      selectedClan: id,
    );
    final result = await clanRepository.getClanById(id);
    state = result.fold(
      (failure) => state.copyWith(clanById: AsyncState.error(failure)),
      (newClan) => state.copyWith(clanById: AsyncState.success(newClan)),
    );
  }

  Future<void> getClans() async {
    state = state.copyWith(clans: const AsyncState.loading());
    final result = await clanRepository.getClans();
    result.fold(
      (l) => state = state.copyWith(clans: AsyncState.error(l)),
      (r) => state = state.copyWith(
        clans: AsyncState.success(r),
      ),
    );
  }

  Future<void> getUsersByClanById(clanId) async {
    state = state.copyWith(users: const AsyncState.loading());
    final result = await clanRepository.getUsersByClanId(clanId);
    result.fold(
      (l) => state = state.copyWith(users: AsyncState.error(l)),
      (r) => state = state.copyWith(
        users: AsyncState.success(r),
        isUserInClan: r.firstWhereOrNull(
              (e) => ref.read(authProvider).authModel.data?.user.id == e.id,
            ) !=
            null,
        userAdded: const AsyncState.success(true),
      ),
    );
  }

  Future<void> createClan(leaderId, name, createdAt) async {
    final result = await clanRepository.createClan(leaderId, name, createdAt);
    result.fold(
      (l) => (failure) => state = state.copyWith(
            clans: AsyncState.error(failure),
          ),
      (r) => null,
    );
  }

  Future<void> addUserToClan(clanId, userId) async {
    state = state.copyWith(
      users: const AsyncState.loading(),
      userAdded: const AsyncState.loading(),
    );
    final result = await clanRepository.addUserToClan(clanId, userId);
    state = result.fold(
      (l) => state.copyWith(userAdded: AsyncState.error(l)),
      (r) => state.copyWith(userAdded: const AsyncState.success(true)),
    );
    await getUsersByClanById(clanId);
  }
}
