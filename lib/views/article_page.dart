import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lojong/bloc/model_item_cubit.dart';
import 'package:lojong/models/article_content.dart';
import 'package:lojong/models/author.dart';
import 'package:lojong/repositories/app_repository.dart';
import 'package:lojong/utils/share_utils.dart';
import 'package:lojong/views/model_item_view.dart';
import 'package:lojong/widgets/app_back_button.dart';
import 'package:lojong/widgets/author_widget.dart';
import 'package:lojong/widgets/image_card.dart';

class ArticlePage extends StatelessWidget {
  final int articleId;
  const ArticlePage(this.articleId, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ArticleItemCubit>(
      create: (context) => ArticleItemCubit(
        () => context.read<AppRepository>().getArticle(articleId),
      )..load(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: const AppBackButton(),
          title: const Text('INSPIRAÇÕES'),
        ),
        body: ModelItemView<ArticleContentModel>(
          itemBuilder: (item) {
            return _buildArticle(item, context);
          },
        ),
      ),
    );
  }

  Widget _buildArticle(ArticleContentModel article, BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 16),
        _buildTitle(article.title, context),
        const SizedBox(height: 12),
        _buildImage(article.imageUrl),
        const SizedBox(height: 10),
        _buildFullText(article.fullText, context),
        const SizedBox(height: 16),
        _buildAuthorWidget(article.author),
        const SizedBox(height: 18),
        _buildShareButton(article),
        const SizedBox(height: 30),
      ],
    );
  }

  Widget _buildImage(String imageUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ImageCard(imageUrl),
    );
  }

  Widget _buildTitle(String title, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: GoogleFonts.asap(
          color: Theme.of(context).colorScheme.onBackground,
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _buildFullText(String fullText, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: Html(
        data: fullText,
        style: {
          "body": Style(
            fontSize: FontSize(14),
            fontWeight: FontWeight.w400,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          "a": Style(
            color: Theme.of(context).colorScheme.primary,
          ),
        },
      ),
    );
  }

  Widget _buildAuthorWidget(AuthorModel author) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: AuthorWidget(author),
    );
  }

  Widget _buildShareButton(ArticleContentModel article) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: ElevatedButton(
        onPressed: () => ShareUtils.shareArticleContent(article),
        child: Text('COMPARTILHAR'),
      ),
    );
  }
}
