import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lojong/models/video.dart';

part 'simple_list_state.dart';

typedef VideoListCubit = SimpleListCubit<VideoModel>;

class SimpleListCubit<T> extends Cubit<SimpleListState<T>> {
  final Future<List<T>> Function() _repositoryMethod;

  SimpleListCubit(this._repositoryMethod) : super(SuccessfulState(const []));

  void load() async {
    emit(LoadingState<T>());
    try {
      final result = await _repositoryMethod();
      emit(SuccessfulState(result));
    } catch (error) {
      emit(ErrorState(error));
    }
  }
}
