import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lojong/bloc/paginated_list_cubit.dart';
import 'package:lojong/bloc/simple_list_cubit.dart';
import 'package:lojong/repositories/app_repository.dart';
import 'package:lojong/views/articles_tab.dart';
import 'package:lojong/views/quotes_tab.dart';
import 'package:lojong/views/videos_tab.dart';
import 'package:lojong/widgets/app_tab_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('INSPIRAÇÕES'),
          bottom: const AppTabBar(),
        ),
        body: MultiBlocProvider(
          providers: [
            BlocProvider<ArticleListCubit>(
              create: (context) => ArticleListCubit(
                context.read<AppRepository>().listArticles,
              )..loadMore(),
            ),
            BlocProvider<QuoteListCubit>(
              create: (context) => QuoteListCubit(
                context.read<AppRepository>().listQuotes,
              )..loadMore(),
            ),
            BlocProvider<VideoListCubit>(
              create: (context) => VideoListCubit(
                context.read<AppRepository>().listVideos,
              )..load(),
            ),
          ],
          child: const TabBarView(
            children: [
              VideosTab(),
              ArticlesTab(),
              QuotesTab(),
            ],
          ),
        ),
      ),
    );
  }
}
