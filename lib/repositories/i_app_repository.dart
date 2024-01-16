import 'package:lojong/models/article_list_result.dart';
import 'package:lojong/models/article_content.dart';

abstract class IAppRepository {
  Future<ArticleListResult> listArticles(int page);
  Future<ArticleContentModel> getArticle(int id);
}
