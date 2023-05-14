import 'package:flutter/material.dart';
import 'package:untorneo_mobile/core/failure/failure.dart';
import 'package:untorneo_mobile/widgets/loading/loading_widget.dart';

sealed class AsyncState<T> {
  factory AsyncState.loading() = AsyncLoading<T>;
  factory AsyncState.initial() = AsyncInitial<T>;
  factory AsyncState.success(T data) = AsyncSuccess<T>;
  factory AsyncState.error(Failure error) = AsyncError<T>;
}

class AsyncInitial<T> implements AsyncState<T> {
  @override
  String toString() => 'AsyncInitial<${T.runtimeType}>';
}

class AsyncLoading<T> implements AsyncState<T> {
  @override
  String toString() => 'AsyncLoading<${T.runtimeType}>';
}

class AsyncSuccess<T> implements AsyncState<T> {
  AsyncSuccess(this.data);
  final T data;

  @override
  String toString() => 'AsyncSuccess<$T>($data)';
}

class AsyncError<T> implements AsyncState<T> {
  AsyncError(this.error);
  final Failure error;

  @override
  String toString() => 'AsyncError<$T>($error)';
}

extension AsyncExtension<T> on AsyncState<T> {
  T? get data => (this is AsyncSuccess) ? (this as AsyncSuccess).data : null;
  Failure? get error =>
      (this is AsyncError) ? (this as AsyncError).error : null;

  W on<W>({
    required W Function(T) onData,
    required W Function(Failure) onError,
    required W Function() onLoading,
    required W Function() onInitial,
  }) {
    switch (runtimeType) {
      case AsyncLoading:
        return onLoading();
      case AsyncInitial:
        return onInitial();
      case AsyncSuccess:
        return onData((this as AsyncSuccess).data);
      case AsyncError:
        return onError((this as AsyncError).error);
      default:
        throw Exception('Invalid state');
    }
  }

  W onMayNull<W>({
    required W Function(T?) onData,
    required W Function(Failure) onError,
    required W Function() onLoading,
    required W Function() onInitial,
  }) {
    switch (runtimeType) {
      case AsyncLoading:
        return onLoading();
      case AsyncInitial:
        return onInitial();
      case AsyncSuccess:
        return onData((this as AsyncSuccess).data);
      case AsyncError:
        return onError((this as AsyncError).error);
      default:
        throw Exception('Invalid state');
    }
  }

  Widget when({
    required Widget Function(T?) onData,
    required Widget Function(Failure) onError,
    required Widget Function()? onLoading,
    required Widget Function()? onInitial,
  }) {
    switch (runtimeType) {
      case AsyncLoading:
        return onLoading?.call() ?? const LoadingWidget();
      case AsyncInitial:
        return onInitial?.call() ?? onLoading?.call() ?? const LoadingWidget();
      case AsyncSuccess:
        return onData((this as AsyncSuccess).data);
      case AsyncError:
        return onError((this as AsyncError).error);
      default:
        throw Exception('Invalid state');
    }
  }
}
