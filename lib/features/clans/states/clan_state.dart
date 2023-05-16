import 'package:equatable/equatable.dart';
import 'package:untorneo_mobile/core/sealed/async_state.dart';
import 'package:untorneo_mobile/features/clans/model/clan_model.dart';

class ClanState extends Equatable {
  const ClanState({
    required this.clanById,
    required this.clans,
  });

  final AsyncState<Clan> clanById;
  final AsyncState<List<Clan>> clans;

  ClanState copyWith({AsyncState<Clan>? clanById, AsyncState<List<Clan>>? clans}) {
    return ClanState(
      clanById: clanById ?? this.clanById,
      clans: clans ?? this.clans,
    );
  }

  @override
  List<Object?> get props => [clanById, clans];
}
