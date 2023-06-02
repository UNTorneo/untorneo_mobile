import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:untorneo_mobile/features/chats/widgets/chat_screen.dart';
import 'package:untorneo_mobile/widgets/widgets/buttons/back_icon_button.dart';

class AfterMatchChatsHomeScreen extends ConsumerStatefulWidget {
  const AfterMatchChatsHomeScreen({super.key});

  static const route = '/chats_home_screen';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AfterMatchChatsHomeScreen();
}

class _AfterMatchChatsHomeScreen extends ConsumerState<AfterMatchChatsHomeScreen> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.removeListener(scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void scrollListener() {
    if (_scrollController.position.maxScrollExtent - 100 < _scrollController.position.pixels) {
      /* ******************************** */
      //The petition for bring more chats
      /* ******************************** */
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          const BackIconButton(),
          const Text(
            'Tus Chats',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 14),
          Expanded(
            child: Scrollbar(
              controller: _scrollController,
              child: ListView(
                children: [
                  Card(
                    child: ListTile(
                      onTap: () => GoRouter.of(context).push(
                        ChatScreen.route,
                      ),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: const Icon(Icons.sports_baseball_sharp),
                      ),
                      title: const Text(
                        'Partido',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text(
                        '~Usuario376: Solo milloz loks',
                        style: TextStyle(fontSize: 10, color: Colors.black26),
                      ),
                      trailing: Container(
                        width: 10,
                        height: 10,
                        margin: const EdgeInsets.all(100.0),
                        decoration: BoxDecoration(color: Colors.amber[600], shape: BoxShape.circle),
                        child: const Text(
                          '18',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
