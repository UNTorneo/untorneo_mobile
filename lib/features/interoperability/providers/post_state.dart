import 'package:equatable/equatable.dart';
import 'package:untorneo_mobile/core/sealed/async_state.dart';
import 'package:untorneo_mobile/features/interoperability/model/post_model.dart';

class PostState extends Equatable {
  const PostState({
    required this.postConsumed,
  });

  final AsyncState<Post> postConsumed;

  PostState copyWith({
    AsyncState<Post>? postConsumed,
  }) {
    return PostState(
      postConsumed: postConsumed ?? this.postConsumed,
    );
  }

  @override
  List<Object?> get props {
    return [
      postConsumed,
    ];
  }
}
