part of 'model_item_cubit.dart';

abstract class ModelItemState<T> extends Equatable {}

class SuccessfulState<T> extends ModelItemState<T> {
  final T item;
  SuccessfulState(this.item);

  @override
  List<Object?> get props => [item];
}

class LoadingState<T> extends ModelItemState<T> {
  @override
  List<Object?> get props => [];
}

class ErrorState<T> extends ModelItemState<T> {
  final Object? error;
  ErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
