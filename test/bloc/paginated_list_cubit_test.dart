import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lojong/bloc/paginated_list_cubit.dart';
import 'package:lojong/models/article_summary.dart';
import 'package:lojong/models/list_result.dart';
import 'package:lojong/models/quote.dart';

import '../fixtures/article_list.dart';
import '../fixtures/quote_list.dart';

void main() {
  group('testing $ArticleListCubit', () {
    final fix = ArticleListFixture();
    late Future<ListResultModel<ArticleSummaryModel>> Function(int) method;
    late Exception exception;

    blocTest(
      'when repository method returns normally, '
      'should emit one state for loading and another for successful.',
      setUp: () async {
        await fix.init();
        method = (page) async => fix.listResult;
      },
      build: () => ArticleListCubit(method),
      act: (bloc) {
        bloc.loadMore();
      },
      expect: () => [
        const PaginatedListState<ArticleSummaryModel>(
          items: [],
          isLoading: true,
          hasMore: true,
          lastError: null,
          lastPage: null,
        ),
        PaginatedListState<ArticleSummaryModel>(
          items: fix.listResult.items,
          isLoading: false,
          hasMore: true,
          lastError: null,
          lastPage: 0,
        ),
      ],
    );
    blocTest(
      'when repository method throws exception, '
      'should emit one state for loading and another for error.',
      setUp: () async {
        exception = Exception();
        method = (page) async => throw exception;
      },
      build: () => ArticleListCubit(method),
      act: (bloc) {
        bloc.loadMore();
      },
      expect: () => [
        const PaginatedListState<ArticleSummaryModel>(
          items: [],
          isLoading: true,
          hasMore: true,
          lastError: null,
          lastPage: null,
        ),
        PaginatedListState<ArticleSummaryModel>(
          items: const [],
          isLoading: false,
          hasMore: true,
          lastError: exception,
          lastPage: null,
        ),
      ],
    );
  });

  group('testing $QuoteListCubit', () {
    final fix = QuoteListFixture();
    late Future<ListResultModel<QuoteModel>> Function(int) method;
    late Exception exception;

    blocTest(
      'when repository method returns normally, '
      'should emit one state for loading and another for successful.',
      setUp: () async {
        await fix.init();
        method = (page) async => fix.listResult;
      },
      build: () => QuoteListCubit(method),
      act: (bloc) {
        bloc.loadMore();
      },
      expect: () => [
        const PaginatedListState<QuoteModel>(
          items: [],
          isLoading: true,
          hasMore: true,
          lastError: null,
          lastPage: null,
        ),
        PaginatedListState<QuoteModel>(
          items: fix.listResult.items,
          isLoading: false,
          hasMore: true,
          lastError: null,
          lastPage: 0,
        ),
      ],
    );
    blocTest(
      'when repository method throws exception, '
      'should emit one state for loading and another for error.',
      setUp: () async {
        exception = Exception();
        method = (page) async => throw exception;
      },
      build: () => QuoteListCubit(method),
      act: (bloc) {
        bloc.loadMore();
      },
      expect: () => [
        const PaginatedListState<QuoteModel>(
          items: [],
          isLoading: true,
          hasMore: true,
          lastError: null,
          lastPage: null,
        ),
        PaginatedListState<QuoteModel>(
          items: const [],
          isLoading: false,
          hasMore: true,
          lastError: exception,
          lastPage: null,
        ),
      ],
    );
  });
}
