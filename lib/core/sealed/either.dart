sealed class Either<L, R> {
  factory Either.left(L left) = Left<L, R>;
  factory Either.right(R right) = Right<L, R>;
}

class Left<L, R> implements Either<L, R> {
  Left(this.left);
  final L left;

  @override
  String toString() => 'Left<$L, $R>($left)';
}

class Right<L, R> implements Either<L, R> {
  Right(this.right);
  final R right;

  @override
  String toString() => 'Right<$L, $R>($right)';
}

extension EitherExtension<L, R> on Either<L, R> {
  L? get left => (this is Left) ? (this as Left).left : null;
  R? get right => (this is Right) ? (this as Right).right : null;

  W fold<W>({
    required W Function(L) left,
    required W Function(R) right,
  }) {
    switch (runtimeType) {
      case Left:
        return left((this as Left).left);
      case Right:
        return right((this as Right).right);
      default:
        throw Exception('Invalid state');
    }
  }
}
