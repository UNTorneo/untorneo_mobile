import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untorneo_mobile/core/sealed/async_state.dart';
import 'package:untorneo_mobile/features/clans/states/clan_provider.dart';
import 'package:untorneo_mobile/features/clans/ui/create_clan_form_bottom_sheet.dart';
import 'package:untorneo_mobile/features/clans/widgets/clan_card.dart';
import 'package:untorneo_mobile/widgets/loading/screen_loading_widget.dart';
import 'package:untorneo_mobile/widgets/widgets/custom_text_field.dart';

class ClansScreen extends ConsumerStatefulWidget {
  const ClansScreen({super.key});

  static const route = '/clans_screen';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ClansScreen();
}

class _ClansScreen extends ConsumerState<ClansScreen> {
  final _toSearchIdController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(10.0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final clanState = ref.watch(clanProvider);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: CustomTextField(
                  label: 'Escribe el id del clan que quieras buscar',
                  controller: _toSearchIdController,
                  keyboardType: TextInputType.number,
                ),
              ),
              IconButton(
                onPressed: _onGetClanById,
                icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: () => ref.refresh(clanProvider),
                icon: const Icon(Icons.delete),
              )
            ],
          ),
        ),
        Expanded(
          child: Scrollbar(
            controller: _scrollController,
            child: clanState.clans.on(
              onData: (data) => data.isNotEmpty
                  ? ListView.builder(
                      controller: _scrollController,
                      itemCount: data.length,
                      itemBuilder: (context, index) =>
                          ClanCard(clan: data[index]),
                    )
                  : const Text('No hay ningún clan'),
              onError: (error) => Text(error.message),
              onLoading: () => const ScreenLoadingWidget(),
              onInitial: () {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ref.read(clanProvider.notifier).getClans();
                });
                return const ScreenLoadingWidget();
              },
            ),
          ),
        ),
        FloatingActionButton.extended(
          label: const Text('Crear'),
          onPressed: () {
            CreateClanFormBottomSheet.show(context: context);
          },
          icon: const Icon(Icons.add),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  void _onGetClanById() {
    if (_toSearchIdController.value.text.isEmpty) return;
    ref.read(clanProvider.notifier).getClanById(
          id: int.parse(_toSearchIdController.value.text),
        );
  }
}
