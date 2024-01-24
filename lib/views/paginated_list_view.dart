import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lojong/bloc/paginated_list_cubit.dart';
import 'package:lojong/widgets/app_error_widget.dart';

class PaginatedListView<T> extends StatefulWidget {
  final Widget Function(T item) itemBuilder;
  final bool showSeparator;
  const PaginatedListView({
    required this.itemBuilder,
    this.showSeparator = false,
    super.key,
  });

  @override
  State<PaginatedListView<T>> createState() => _PaginatedListViewState<T>();
}

class _PaginatedListViewState<T> extends State<PaginatedListView<T>> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_loadMore);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_loadMore);
    _scrollController.dispose();
    super.dispose();
  }

  void _loadMore() {
    if (_scrollController.position.pixels >
        _scrollController.position.maxScrollExtent * 0.75) {
      context.read<PaginatedListCubit<T>>().loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaginatedListCubit<T>, PaginatedListState<T>>(
      builder: (context, state) {
        if (state.items.isNotEmpty) {
          return _buildList(state);
        } else if (state.isLoading) {
          return _buildLoadingIndicator();
        } else if (state.lastError != null) {
          return _buildError(context, state.lastError!);
        } else {
          return _buildEmptyList();
        }
      },
    );
  }

  Widget _buildList(PaginatedListState<T> state) {
    var itemCount = state.items.length;
    if (state.isLoading) itemCount++;

    if (widget.showSeparator) {
      return ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        controller: _scrollController,
        itemCount: itemCount,
        itemBuilder: (context, index) => _itemBuilderWithFooter(
          state: state,
          context: context,
          index: index,
        ),
      );
    } else {
      return ListView.builder(
        controller: _scrollController,
        itemCount: itemCount,
        itemBuilder: (context, index) => _itemBuilderWithFooter(
          state: state,
          context: context,
          index: index,
        ),
      );
    }
  }

  Widget _itemBuilderWithFooter({
    required PaginatedListState<T> state,
    required BuildContext context,
    required int index,
  }) {
    if (index < state.items.length) {
      return widget.itemBuilder(state.items[index]);
    } else {
      return _buildListFooter();
    }
  }

  Widget _buildListFooter() {
    return const SizedBox(
      height: 42,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Center(
          child: FittedBox(child: CircularProgressIndicator()),
        ),
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildError(BuildContext context, Object error) {
    return Center(
      child: AppErrorWidget(
        retry: context.read<PaginatedListCubit<T>>().loadMore,
      ),
    );
  }

  Widget _buildEmptyList() {
    return const Center(child: Text('Lista vazia'));
  }
}
