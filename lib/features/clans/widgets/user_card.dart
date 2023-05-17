import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:untorneo_mobile/core/theme/theme.dart';
import 'package:untorneo_mobile/features/clans/model/clan_model.dart';
import 'package:untorneo_mobile/features/clans/ui/clan_detail_screen.dart';
import 'package:untorneo_mobile/features/users/models/user_model.dart';

class UserCard extends ConsumerWidget {
  const UserCard({
    super.key,
    required this.user,
  });

  final UserModel user;

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
          Text(user.name, style: theme.titleLarge),
          const Divider(),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
