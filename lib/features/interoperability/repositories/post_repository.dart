import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untorneo_mobile/core/failure/failure.dart';
import 'package:untorneo_mobile/core/sealed/either.dart';
import 'package:untorneo_mobile/features/interoperability/data_source/post_data_source.dart';
import 'package:untorneo_mobile/features/interoperability/model/post_model.dart';

final postRepositoryProvider = Provider<PostRepository>((ref) {
  return PostRepositoryImpl.fromRef(ref);
});

abstract class PostRepository {
  Future<Either<Failure, Post>> getConsumerPost();
}

class PostRepositoryImpl implements PostRepository {
  PostRepositoryImpl(this.postDataSource);

  factory PostRepositoryImpl.fromRef(Ref ref) {
    final postDataSource = ref.read(postDataSourceProvider);
    return PostRepositoryImpl(postDataSource);
  }

  final PostDataSource postDataSource;
  
  @override
  Future<Either<Failure, Post>> getConsumerPost() async {
    try {
      final res = await postDataSource.getConsumerPost();
      return Right(res);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}