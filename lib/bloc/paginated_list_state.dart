import 'package:equatable/equatable.dart';
import 'package:lojong/models/list_result.dart';

class PaginatedListState<T> extends Equatable {
  final List<T> list;
  final bool isLoading;
  final bool hasMore;
  final Object? lastError;
  final int? lastPage;

  const PaginatedListState._({
    required this.list,
    required this.isLoading,
    required this.hasMore,
    required this.lastError,
    required this.lastPage,
  });

  PaginatedListState.initialState()
      : list = [],
        isLoading = false,
        hasMore = true,
        lastPage = null,
        lastError = null;

  PaginatedListState<T> addResult(ListResultModel<T> result) {
    return PaginatedListState._(
      list: list + result.items,
      isLoading: false,
      hasMore: result.hasMore,
      lastError: null,
      lastPage: result.currentPage,
    );
  }

  PaginatedListState<T> loading() {
    return PaginatedListState._(
      list: list,
      isLoading: true,
      hasMore: hasMore,
      lastError: null,
      lastPage: lastPage,
    );
  }

  PaginatedListState<T> withError(Object error) {
    return PaginatedListState._(
      list: list,
      isLoading: false,
      hasMore: hasMore,
      lastError: error,
      lastPage: lastPage,
    );
  }

  @override
  List<Object?> get props => [list, isLoading, hasMore, lastError, lastPage];
}
