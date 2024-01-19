import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lojong/bloc/paginated_list_cubit.dart';
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
          centerTitle: true,
          title: Text(
            'INSPIRAÇÕES',
            style: GoogleFonts.asap(fontWeight: FontWeight.w700, fontSize: 14),
          ),
          bottom: const AppTabBar(),
        ),
        body: RepositoryProvider(
          create: (context) => AppRepository(
            Dio(BaseOptions(headers: AppRepository.baseHeaders)),
          ),
          child: BlocProvider(
            create: (context) => ArticleListCubit(
              context.read<AppRepository>().listArticles,
            ),
            child: const TabBarView(
              children: [
                VideosTab(),
                ArticlesTab(),
                QuotesTab(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
