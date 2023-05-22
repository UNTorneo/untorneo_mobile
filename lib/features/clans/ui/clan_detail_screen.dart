import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untorneo_mobile/core/sealed/async_state.dart';
import 'package:untorneo_mobile/features/auth/state/auth_provider.dart';
import 'package:untorneo_mobile/features/clans/states/clan_provider.dart';
import 'package:untorneo_mobile/features/clans/widgets/user_card.dart';
import 'package:untorneo_mobile/features/error/error_screen.dart';
import 'package:untorneo_mobile/features/users/state/users_provider.dart';
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
  final _scrollController = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(clanProvider.notifier).getClanById(id: int.parse(widget.clanId));
      ref
          .read(clanProvider.notifier)
          .getUsersByClanById(int.parse(widget.clanId));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final clanState = ref.watch(clanProvider);
    final userState = ref.watch(usersProvider);
    return clanState.clanById.on(
      onError: (error) => ErrorScreen(error: error.message),
      onInitial: () => const LoadingScreen(),
      onLoading: () => const LoadingScreen(),
      onData: (data) {
        return Scaffold(
          appBar: AppBar(title: const Text('Clan')),
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Líder',
                style: theme.titleLarge,
                textAlign: TextAlign.start,
              ),
              userState.user.on(
                onData: (user) =>
                    Text(user.username, textAlign: TextAlign.start),
                onError: (error) => Text(error.message),
                onInitial: () {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    ref.read(usersProvider.notifier).getUser(data.leaderId);
                  });
                  return const ScreenLoadingWidget();
                },
                onLoading: () => const ScreenLoadingWidget(),
              ),
              const SizedBox(height: 12),
              Text('Creado el', style: theme.titleMedium),
              Text(data.createdAt.substring(0, 9), style: theme.bodyMedium),
              const SizedBox(height: 20),
              Text(
                'Miembros',
                style: theme.titleMedium,
                textAlign: TextAlign.start,
              ),
              Expanded(
                child: Scrollbar(
                  controller: _scrollController,
                  child: clanState.users.on(
                    onData: (data) {
                      return data.isNotEmpty
                          ? ListView.builder(
                              controller: _scrollController,
                              padding: const EdgeInsets.all(16),
                              itemCount: data.length,
                              itemBuilder: (context, index) =>
                                  UserCard(user: data[index]),
                            )
                          : const Text('No hay miembros');
                    },
                    onError: (error) => ErrorScreen(error: error.message),
                    onLoading: () => const ScreenLoadingWidget(),
                    onInitial: () => const ScreenLoadingWidget(),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
          floatingActionButton: clanState.userAdded.when(
            onError: (_) => const SizedBox.shrink(),
            onData: (_) => clanState.isUserInClan
                ? FloatingActionButton.extended(
                    onPressed: _onUniteHandle,
                    label: const Text('Salir'),
                    icon: const Icon(Icons.group_remove),
                  )
                : FloatingActionButton.extended(
                    onPressed: _onUniteHandle,
                    label: const Text('Únete'),
                    icon: const Icon(Icons.group_add),
                  ),
          ),
        );
      },
    );
  }

  void _onUniteHandle() {
    ref.read(clanProvider.notifier).addUserToClan(
          int.parse(widget.clanId),
          ref.read(authProvider).authModel.data!.user.id,
        );
  }
}
