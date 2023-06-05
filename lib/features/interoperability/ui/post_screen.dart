import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:untorneo_mobile/core/sealed/async_state.dart';

class PostScreen extends ConsumerStatefulWidget {
  const PostScreen({super.key, required this.postId});

  static const route = '/post';
  static const routeParams = '/post/:id';

  final String postId;

  @override
  createState() => _PostScreen();
}

class _PostScreen extends ConsumerState<PostScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Post')),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  child: Icon(Icons.person),
                ),
                const SizedBox(
                  width: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Usuario',
                      style: theme.headlineLarge,
                    ), //Se trae con el ownerId
                    Text(
                      'Publicado en: Bogotá', //location
                      style: TextStyle(color: Colors.black38),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '03-04-2022',
              textAlign: TextAlign.end,
              style: TextStyle(color: Colors.black38),
            ),
            Text(
              '(Editado: 08-04-2022)',
              style: TextStyle(color: Colors.black38),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
              style: theme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
