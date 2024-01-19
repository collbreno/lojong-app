import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lojong/bloc/paginated_list_cubit.dart';

class ArticlesTab extends StatefulWidget {
  const ArticlesTab({super.key});

  @override
  State<ArticlesTab> createState() => _ArticlesTabState();
}

class _ArticlesTabState extends State<ArticlesTab> {
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
      print('trying to load more!!!');
      context.read<PaginatedListCubit>().loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleListCubit, ArticleListState>(
      builder: (context, state) {
        if (state.lastError != null) {
          return const Center(child: Text('Algo deu errado'));
        } else if (state.list.isEmpty && state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.list.isNotEmpty) {
          return ListView.builder(
            controller: _scrollController,
            itemCount: state.list.length,
            itemBuilder: (context, index) {
              final article = state.list[index];
              return ListTile(
                title: Text(article.title),
                subtitle: Text(article.text),
              );
            },
          );
        } else {
          return const Center(child: Text('Lista vazia'));
        }
      },
    );
  }
}