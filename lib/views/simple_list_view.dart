import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lojong/bloc/simple_list_cubit.dart';
import 'package:lojong/bloc/simple_list_state.dart';

class SimpleListView<T> extends StatelessWidget {
  final Widget Function(T item) itemBuilder;

  const SimpleListView({required this.itemBuilder, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimpleListCubit<T>, SimpleListState<T>>(
      builder: (context, state) {
        if (state is LoadingState<T>) {
          return _buildLoadingIndicator();
        } else if (state is ErrorState<T>) {
          return _buildError(state.error);
        } else if (state is SuccessfulState<T>) {
          if (state.items.isNotEmpty) {
            return _buildList(state.items);
          } else {
            return _buildEmptyList();
          }
        } else {
          throw UnimplementedError();
        }
      },
    );
  }

  Widget _buildLoadingIndicator() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildError(Object? error) {
    return const Center(child: Text('Algo deu errado'));
  }

  Widget _buildEmptyList() {
    return const Center(child: Text('Lista vazia'));
  }

  Widget _buildList(List<T> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) => itemBuilder(items[index]),
    );
  }
}
