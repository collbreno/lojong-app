import 'package:equatable/equatable.dart';
import 'package:lojong/models/article_summary.dart';
import 'package:lojong/models/list_result.dart';

class ArticleListState extends Equatable {
  final List<ArticleSummaryModel> articles;
  final bool isLoading;
  final bool hasMore;
  final Object? lastError;
  final int? lastPage;

  const ArticleListState._({
    required this.articles,
    required this.isLoading,
    required this.hasMore,
    required this.lastError,
    required this.lastPage,
  });

  ArticleListState.initialState()
      : articles = [],
        isLoading = false,
        hasMore = true,
        lastPage = null,
        lastError = null;

  ArticleListState addResult(ListResultModel<ArticleSummaryModel> result) {
    return ArticleListState._(
      articles: articles + result.items,
      isLoading: false,
      hasMore: result.hasMore,
      lastError: null,
      lastPage: result.currentPage,
    );
  }

  ArticleListState loading() {
    return ArticleListState._(
      articles: articles,
      isLoading: true,
      hasMore: hasMore,
      lastError: null,
      lastPage: lastPage,
    );
  }

  ArticleListState withError(Object error) {
    return ArticleListState._(
      articles: articles,
      isLoading: false,
      hasMore: hasMore,
      lastError: error,
      lastPage: lastPage,
    );
  }

  @override
  List<Object?> get props =>
      [articles, isLoading, hasMore, lastError, lastPage];
}
