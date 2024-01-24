part of 'paginated_list_cubit.dart';

class PaginatedListState<T> extends Equatable {
  final List<T> items;
  final bool isLoading;
  final bool hasMore;
  final Object? lastError;
  final int? lastPage;

  @visibleForTesting
  const PaginatedListState({
    required this.items,
    required this.isLoading,
    required this.hasMore,
    required this.lastError,
    required this.lastPage,
  });

  PaginatedListState.initialState()
      : items = [],
        isLoading = false,
        hasMore = true,
        lastPage = null,
        lastError = null;

  PaginatedListState<T> addResult(ListResultModel<T> result) {
    return PaginatedListState(
      items: items + result.items,
      isLoading: false,
      hasMore: result.hasMore,
      lastError: null,
      lastPage: result.currentPage,
    );
  }

  PaginatedListState<T> loading() {
    return PaginatedListState(
      items: items,
      isLoading: true,
      hasMore: hasMore,
      lastError: null,
      lastPage: lastPage,
    );
  }

  PaginatedListState<T> withError(Object error) {
    return PaginatedListState(
      items: items,
      isLoading: false,
      hasMore: hasMore,
      lastError: error,
      lastPage: lastPage,
    );
  }

  @override
  List<Object?> get props => [items, isLoading, hasMore, lastError, lastPage];
}
