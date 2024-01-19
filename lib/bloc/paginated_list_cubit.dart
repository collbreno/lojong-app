import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lojong/bloc/paginated_list_state.dart';
import 'package:lojong/models/article_summary.dart';
import 'package:lojong/models/list_result.dart';
import 'package:lojong/models/quote.dart';

typedef ArticleListCubit = PaginatedListCubit<ArticleSummaryModel>;
typedef ArticleListState = PaginatedListState<ArticleSummaryModel>;
typedef QuoteListCubit = PaginatedListCubit<QuoteModel>;
typedef QuoteListState = PaginatedListState<QuoteModel>;

class PaginatedListCubit<T> extends Cubit<PaginatedListState<T>> {
  final Future<ListResultModel<T>> Function(int page) repositoryMethod;
  PaginatedListCubit(this.repositoryMethod)
      : super(PaginatedListState.initialState()) {
    loadMore();
  }

  void loadMore() async {
    if (!state.hasMore || state.isLoading) {
      return;
    }
    print('loading more!!!');

    final page = state.lastPage != null ? state.lastPage! + 1 : 0;
    emit(state.loading());
    try {
      final result = await repositoryMethod(page);
      emit(state.addResult(result));
    } on Exception catch (error) {
      emit(state.withError(error));
    }
  }
}
