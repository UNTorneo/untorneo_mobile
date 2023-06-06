import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untorneo_mobile/core/external/gql_handler.dart';
import 'package:untorneo_mobile/core/sealed/async_state.dart';
import 'package:untorneo_mobile/core/sealed/either.dart';
import 'package:untorneo_mobile/features/interoperability/providers/post_state.dart';
import 'package:untorneo_mobile/features/interoperability/repositories/post_repository.dart';

final graphQLProvider = Provider<GraphQLHandler>(GraphQLHandler.fromRef);

final postProvider = StateNotifierProvider<PostProvider, PostState>((ref) {
  return PostProvider.fromRead(ref);
});

class PostProvider extends StateNotifier<PostState> {
  PostProvider({
    required this.postRepository,
    required this.ref,
  }) : super(
          const PostState(
            postConsumed: AsyncState.initial(),
          ),
        );

  factory PostProvider.fromRead(Ref ref) {
    final postRepository = ref.read(postRepositoryProvider);
    return PostProvider(
      ref: ref,
      postRepository: postRepository,
    );
  }

  final Ref ref;
  final PostRepository postRepository;

  Future<void> getConsumerPost() async {
    state = state.copyWith(
      postConsumed: const AsyncState.loading(),
    );
    final result = await postRepository.getConsumerPost();
    state = result.fold(
      (failure) => state.copyWith(postConsumed: AsyncState.error(failure)),
      (newPost) => state.copyWith(postConsumed: AsyncState.success(newPost)),
    );
  }
}