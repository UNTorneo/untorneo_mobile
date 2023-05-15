sealed class Either<L, R> {
  factory Either.left(L left) = Left<L, R>;
  factory Either.right(R right) = Right<L, R>;
}

class Left<L, R> implements Either<L, R> {
  const Left(this.left);
  final L left;

  @override
  String toString() => 'Left<$L, $R>($left)';
}

class Right<L, R> implements Either<L, R> {
  const Right(this.right);
  final R right;

  @override
  String toString() => 'Right<$L, $R>($right)';
}

extension EitherExtension<L, R> on Either<L, R> {
  L? get left => (this is Left<L, R>) ? (this as Left<L, R>).left : null;
  R? get right => (this is Right<L, R>) ? (this as Right<L, R>).right : null;

  bool get isLeft => this is Left<L, R>;
  bool get isRight => this is Right<L, R>;

  W fold<W>(
    W Function(L) left,
    W Function(R) right,
  ) {
    if (this is Left<L, R>) {
      return left((this as Left<L, R>).left);
    } else if (this is Right<L, R>) {
      return right((this as Right<L, R>).right);
    } else {
      throw Exception('Unhandled Either case');
    }
  }
}
