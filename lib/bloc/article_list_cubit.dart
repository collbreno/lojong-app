import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lojong/bloc/article_list_state.dart';
import 'package:lojong/repositories/app_repository.dart';

class ArticleListCubit extends Cubit<ArticleListState> {
  final AppRepository repository;
  ArticleListCubit(this.repository) : super(ArticleListState.initialState()) {
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
      final result = await repository.listArticles(page);
      emit(state.addResult(result));
    } on Exception catch (error) {
      emit(state.withError(error));
    }
  }
}
