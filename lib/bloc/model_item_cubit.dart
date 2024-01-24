import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lojong/models/article_content.dart';

part 'model_item_state.dart';

typedef ArticleItemCubit = ModelItemCubit<ArticleContentModel>;

class ModelItemCubit<T> extends Cubit<ModelItemState<T>> {
  final Future<T> Function() _repositoryMethod;

  ModelItemCubit(this._repositoryMethod) : super(LoadingState());

  void load() async {
    emit(LoadingState());
    try {
      final result = await _repositoryMethod();
      emit(SuccessfulState(result));
    } catch (error) {
      emit(ErrorState(error));
    }
  }
}
