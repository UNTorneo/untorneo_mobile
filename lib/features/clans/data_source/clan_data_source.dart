import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untorneo_mobile/core/external/api_handler.dart';
import 'package:untorneo_mobile/core/logger/logger.dart';
import 'package:untorneo_mobile/features/clans/model/clan_model.dart';

final clanDataSourceProvider = Provider<ClanDataSource>((ref) {
  return ClanDataSourceImpl.fromRead(ref);
});

abstract class ClanDataSource {
  Future<Clan> getClanById(int venueId);
  Future<List<Clan>> getClans();
}

class ClanDataSourceImpl implements ClanDataSource {
  ClanDataSourceImpl(this.apiHandler);

  factory ClanDataSourceImpl.fromRead(Ref ref) {
    return ClanDataSourceImpl(ref.read(apiHandlerProvider));
  }

  final ApiHandler apiHandler;
  
  @override
  Future<Clan> getClanById(int clanId) async {
    try {
      final res = await apiHandler.get(
        '/clans/$clanId',
      );
      return Clan.fromMap(res.responseMap!);
    } catch (e, s) {
      Logger.logError(e.toString(), s);
      rethrow;
    }
  }
  
  @override
  Future<List<Clan>> getClans() async {
    try {
      final res = await apiHandler
          .get('/clans');
      return [
        ...List.from(res.responseList!).map((venue) => Clan.fromMap(venue)).toList(),
      ];
    } catch (e, s) {
      Logger.logError(e.toString(), s);
      rethrow;
    }
  }
}