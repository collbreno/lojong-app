import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lojong/bloc/simple_list_state.dart';
import 'package:lojong/models/video.dart';

typedef VideoListCubit = SimpleListCubit<VideoModel>;

class SimpleListCubit<T> extends Cubit<SimpleListState<T>> {
  final Future<List<T>> Function() repositoryMethod;

  SimpleListCubit(this.repositoryMethod) : super(SuccessfulState(const [])) {
    load();
  }

  void load() async {
    emit(LoadingState<T>());
    try {
      final result = await repositoryMethod();
      emit(SuccessfulState(result));
    } on Exception catch (error) {
      emit(ErrorState(error));
      rethrow;
    }
  }
}
