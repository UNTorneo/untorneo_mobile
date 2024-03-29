import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:untorneo_mobile/core/theme/theme.dart';
import 'package:untorneo_mobile/features/clans/model/clan_model.dart';
import 'package:untorneo_mobile/features/clans/ui/clan_detail_screen.dart';

class ClanCard extends ConsumerWidget {
  const ClanCard({
    super.key,
    required this.clan,
  });

  final Clan clan;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: ref.read(themeProvider.notifier).roundedBoxDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(clan.name, style: theme.titleLarge),
          const Divider(),
          RichText(
            text: TextSpan(
              style: theme.bodyLarge,
              children: [
                const TextSpan(text: 'Creado el '),
                TextSpan(
                  text: clan.createdAt.substring(0, 9),
                  style: theme.titleMedium,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          FilledButton(
            onPressed: () => GoRouter.of(context).push(
              '${ClanDetailScreen.route}/${clan.id}',
            ),
            child: const Text('Ver'),
          ),
        ],
      ),
    );
  }
}
