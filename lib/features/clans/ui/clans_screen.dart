import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untorneo_mobile/core/sealed/async_state.dart';
import 'package:untorneo_mobile/features/clans/states/clan_provider.dart';
import 'package:untorneo_mobile/features/clans/widgets/clan_card.dart';
import 'package:untorneo_mobile/widgets/loading/screen_loading_widget.dart';

class ClansScreen extends ConsumerStatefulWidget {
  const ClansScreen({super.key});

  static const route = '/clans_screen';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ClansScreen();
}

class _ClansScreen extends ConsumerState<ClansScreen> {
  
  @override
  Widget build(BuildContext context) {
    final clanState = ref.watch(clanProvider);
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: Column(
            children: [
              const Text(
                'Clanes',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Scrollbar(
                child: clanState.clans.on(
                  onData: (data) => data.isNotEmpty ?
                    ListView.builder(
                      itemBuilder: (context, index) => ClanCard(clan: data[index]),
                    ) : const Text('No hay ningún clan'),
                  onError: (error) => Text(error.message),
                  onLoading: () => const ScreenLoadingWidget(),
                  onInitial: () => const ScreenLoadingWidget(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}