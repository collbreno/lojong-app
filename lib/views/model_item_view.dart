import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lojong/bloc/model_item_cubit.dart';
import 'package:lojong/widgets/app_error_widget.dart';

class ModelItemView<T> extends StatelessWidget {
  final Widget Function(T item) itemBuilder;

  const ModelItemView({required this.itemBuilder, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModelItemCubit<T>, ModelItemState<T>>(
      builder: (context, state) {
        if (state is LoadingState<T>) {
          return _buildLoadingIndicator();
        } else if (state is ErrorState<T>) {
          return _buildError(context, state.error);
        } else if (state is SuccessfulState<T>) {
          return itemBuilder(state.item);
        } else {
          throw UnimplementedError();
        }
      },
    );
  }

  Widget _buildLoadingIndicator() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildError(BuildContext context, Object? error) {
    return Center(
      child: AppErrorWidget(retry: context.read<ModelItemCubit<T>>().load),
    );
  }
}
