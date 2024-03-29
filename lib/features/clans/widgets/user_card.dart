import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:untorneo_mobile/core/theme/theme.dart';
import 'package:untorneo_mobile/features/users/models/user_model.dart';
import 'package:untorneo_mobile/features/users/ui/profile_detail_screen.dart';

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
          Text(user.isActive ? 'Activo' : 'No Activo'),
          const SizedBox(height: 10),
          FilledButton(
            onPressed: () => GoRouter.of(context).push(
              '${ProfileDetailScreen.route}/${user.id}',
            ),
            child: const Text('Ver Perfil'),
          ),
        ],
      ),
    );
  }
}
