import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:untorneo_mobile/core/logger/logger.dart';
import 'package:untorneo_mobile/core/sealed/async_state.dart';
import 'package:untorneo_mobile/features/clans/states/clan_provider.dart';
import 'package:untorneo_mobile/features/clans/ui/clan_detail_screen.dart';
import 'package:untorneo_mobile/widgets/bottom_sheet/base_bottom_sheet.dart';
import 'package:untorneo_mobile/widgets/bottom_sheet/bottom_sheet_constants.dart';
import 'package:untorneo_mobile/widgets/widgets/custom_text_field.dart';

class CreateClanFormBottomSheet extends ConsumerStatefulWidget {
  const CreateClanFormBottomSheet({
    super.key,
  });

  static Future<void> show({
    required BuildContext context,
  }) {
    return showModalBottomSheet(
      context: context,
      shape: BottomSheetConstants.shape,
      builder: (context) => const CreateClanFormBottomSheet(),
    );
  }

  @override
  ConsumerState<CreateClanFormBottomSheet> createState() => _CreateClanFormBottomSheetState();
}

class _CreateClanFormBottomSheetState extends ConsumerState<CreateClanFormBottomSheet> {
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: Navigator.of(context).pop,
            icon: const Icon(Icons.close),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Crea tu clan',
                style:
                    Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 20),
          CustomTextField(
            label: 'Nombre',
            controller: nameController,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _onCreateHandle,
            child: const Text('Crear'),
          )
        ],
      ),
    );
  }

  void _onCreateHandle() async {
    if (nameController.value.text.isEmpty) return;
    final clanState = ref.watch(clanProvider);
    final today = DateFormat('yyyy-MM-dd').format(DateTime.now());
    await ref.read(clanProvider.notifier).createClan(
          1,
          nameController.value.text,
          today.toString(),
        );
    await ref.read(clanProvider.notifier).getClans();
    Logger.log('*********************************************');
    Logger.log(clanState.clans.toString());
    Logger.log('*********************************************');
    try {
      GoRouter.of(context).push(
        '${ClanDetailScreen.route}/${clanState.clans.data!.length+1}',
      );
    } catch (e, s) {
      Logger.logError(e.toString(), s);
    }
  }
}
