import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untorneo_mobile/core/sealed/async_state.dart';
import 'package:untorneo_mobile/features/error/error_screen.dart';
import 'package:untorneo_mobile/features/interoperability/providers/post_provider.dart';
import 'package:untorneo_mobile/widgets/loading/screen_loading_widget.dart';

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final postState = ref.watch(postProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Post')),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: postState.postConsumed.on(
          onData: (data) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircleAvatar(
                    radius: 20,
                    child: Icon(Icons.person),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.ownerId,
                          style: theme.headlineLarge,
                        ), //Se trae con el ownerId
                        Text(
                          'Publicado en: ${data.location}', //location
                          style: const TextStyle(color: Colors.black38),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                data.description,
                style: theme.bodyMedium,
              ),
            ],
          ),
          onError: (error) => ErrorScreen(
            error: error.message,
          ),
          onInitial: () {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ref.read(postProvider.notifier).getConsumerPost();
            });
            return const ScreenLoadingWidget();
          },
          onLoading: () => const ScreenLoadingWidget(),
        ),
      ),
    );
  }
}
