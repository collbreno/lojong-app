import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lojong/bloc/model_item_cubit.dart';
import 'package:lojong/models/article_content.dart';
import 'package:lojong/models/author.dart';
import 'package:lojong/repositories/app_repository.dart';
import 'package:lojong/views/model_item_view.dart';
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
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('INSPIRAÇÕES'),
          centerTitle: true,
        ),
        body: ModelItemView<ArticleContentModel>(
          itemBuilder: (item) {
            return _buildArticle(item);
          },
        ),
      ),
    );
  }

  Widget _buildArticle(ArticleContentModel article) {
    return ListView(
      children: [
        const SizedBox(height: 16),
        _buildImage(article.imageUrl),
        const SizedBox(height: 26),
        _buildTitle(article.title),
        const SizedBox(height: 10),
        _buildFullText(article.fullText),
        const SizedBox(height: 16),
        _buildAuthorWidget(article.author),
        const SizedBox(height: 18),
        _buildShareButton(),
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

  Widget _buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: GoogleFonts.asap(
          color: const Color.fromRGBO(0, 0, 0, 0.55),
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _buildFullText(String fullText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: Html(
        data: fullText,
        style: {
          "body": Style(
            fontSize: FontSize(13),
            fontWeight: FontWeight.w400,
            color: const Color.fromRGBO(128, 132, 143, 1),
            fontFamily: 'Asap',
          ),
          "a": Style(
            color: Color.fromRGBO(216, 138, 161, 1),
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

  Widget _buildShareButton() {
    return ElevatedButton(onPressed: () {}, child: Text('COMPARTILHAR'));
  }
}
