part of 'simple_list_cubit.dart';

abstract class SimpleListState<T> extends Equatable {}

class SuccessfulState<T> extends SimpleListState<T> {
  final List<T> items;
  SuccessfulState(this.items);

  @override
  List<Object?> get props => [items];
}

class LoadingState<T> extends SimpleListState<T> {
  @override
  List<Object?> get props => [];
}

class ErrorState<T> extends SimpleListState<T> {
  final Object? error;
  ErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
