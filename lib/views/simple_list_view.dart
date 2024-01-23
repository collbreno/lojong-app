import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lojong/bloc/simple_list_cubit.dart';
import 'package:lojong/bloc/simple_list_state.dart';
import 'package:lojong/widgets/app_error_widget.dart';

class SimpleListView<T> extends StatelessWidget {
  final Widget Function(T item) itemBuilder;

  const SimpleListView({required this.itemBuilder, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimpleListCubit<T>, SimpleListState<T>>(
      builder: (context2, state) {
        if (state is LoadingState<T>) {
          return _buildLoadingIndicator();
        } else if (state is ErrorState<T>) {
          return _buildError(
            state.error,
            () => context.read<SimpleListCubit<T>>().load(),
          );
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

  Widget _buildError(Object? error, VoidCallback retry) {
    return Center(
      child: AppErrorWidget(retry: retry),
    );
  }

  Widget _buildEmptyList() {
    return const Center(child: Text('Lista vazia'));
  }

  Widget _buildList(List<T> items) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(),
      itemCount: items.length,
      itemBuilder: (context, index) => itemBuilder(items[index]),
    );
  }
}
