import 'package:equatable/equatable.dart';
import 'package:untorneo_mobile/core/sealed/async_state.dart';
import 'package:untorneo_mobile/features/clans/model/clan_model.dart';
import 'package:untorneo_mobile/features/users/models/user_model.dart';

class ClanState extends Equatable {
  const ClanState({
    required this.clanById,
    required this.clans,
    required this.userAdded,
    required this.users,
    this.isUserInClan = false,
    this.selectedClan,
  });

  final AsyncState<Clan> clanById;
  final AsyncState<List<Clan>> clans;
  final AsyncState<bool> userAdded;
  final AsyncState<List<UserModel>> users;
  final bool isUserInClan;
  final int? selectedClan;

  ClanState copyWith({
    AsyncState<Clan>? clanById,
    AsyncState<List<Clan>>? clans,
    AsyncState<bool>? userAdded,
    AsyncState<List<UserModel>>? users,
    bool? isUserInClan,
    int? selectedClan,
  }) {
    return ClanState(
      clanById: clanById ?? this.clanById,
      clans: clans ?? this.clans,
      userAdded: userAdded ?? this.userAdded,
      users: users ?? this.users,
      isUserInClan: isUserInClan ?? this.isUserInClan,
      selectedClan: selectedClan ?? this.selectedClan,
    );
  }

  @override
  List<Object?> get props {
    return [
      clanById,
      clans,
      userAdded,
      users,
      isUserInClan,
      selectedClan,
    ];
  }
}
