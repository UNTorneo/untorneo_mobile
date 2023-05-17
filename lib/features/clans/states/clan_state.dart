import 'package:equatable/equatable.dart';
import 'package:untorneo_mobile/core/sealed/async_state.dart';
import 'package:untorneo_mobile/features/clans/model/clan_model.dart';

class ClanState extends Equatable {
  const ClanState({
    required this.clanById,
    required this.clans,
    required this.userAdded,
  });

  final AsyncState<Clan> clanById;
  final AsyncState<List<Clan>> clans;
  final AsyncState<bool> userAdded;

  ClanState copyWith({AsyncState<Clan>? clanById, AsyncState<List<Clan>>? clans, AsyncState<bool>? userAdded}) {
    return ClanState(
      clanById: clanById ?? this.clanById,
      clans: clans ?? this.clans,
      userAdded: userAdded ?? this.userAdded,
    );
  }

  @override
  List<Object?> get props => [clanById, clans, userAdded];
}
