import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untorneo_mobile/core/sealed/async_state.dart';
import 'package:untorneo_mobile/core/utils/formatters.dart';
import 'package:untorneo_mobile/features/clans/states/clan_provider.dart';
import 'package:untorneo_mobile/features/error/error_screen.dart';
import 'package:untorneo_mobile/features/tournaments/state/tournament_provider.dart';
import 'package:untorneo_mobile/widgets/fields/field_item_widget.dart';
import 'package:untorneo_mobile/widgets/loading/screen_loading_widget.dart';

class ClanDetailScreen extends ConsumerStatefulWidget {
  const ClanDetailScreen({super.key, required this.clanId});

  static const route = '/clans';
  static const routeParams = '/clans/:id';

  final String clanId;

  @override
  createState() => _ClanDetailScreen();
}

class _ClanDetailScreen extends ConsumerState<ClanDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(clanProvider.notifier);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final clanState = ref.watch(clanProvider);
    return clanState.clanById.on(
      onError: (error) => ErrorScreen(error: error.message),
      onInitial: () => const Scaffold(body: ScreenLoadingWidget()),
      onLoading: () => const Scaffold(body: ScreenLoadingWidget()),
      onData: (data) => Scaffold(
        appBar: AppBar(title: Text(data.name)),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text('Líder', style: theme.titleLarge),
            Text(data.leaderId.toString(), style: theme.titleMedium),
            const SizedBox(height: 12),
            Text('Creado el', style: theme.titleMedium),
            Text(data.createdAt, style: theme.bodyMedium),
            const SizedBox(height: 12),

            //Lista de usuarios
          ],
        ),
      ),
    );
  }
}
