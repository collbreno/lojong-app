import 'package:lojong/models/article_summary.dart';

class ArticleListResult {
  final int currentPage;
  final bool hasMore;
  final List<ArticleSummaryModel> articles;

  ArticleListResult.fromJSON(Map<String, dynamic> json)
      : currentPage = json['current_page'],
        hasMore = json['has_more'],
        articles = (json['list'] as List)
            .map((e) => ArticleSummaryModel.fromJSON(e))
            .toList();
}
