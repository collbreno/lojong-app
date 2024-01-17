import 'package:lojong/models/article_content.dart';
import 'package:lojong/models/article_summary.dart';
import 'package:lojong/models/list_result.dart';
import 'package:lojong/models/quote.dart';
import 'package:lojong/models/video.dart';

abstract class IAppRepository {
  Future<ListResultModel<ArticleSummaryModel>> listArticles(int page);
  Future<ListResultModel<QuoteModel>> listQuotes(int page);
  Future<List<VideoModel>> listVideos();
  Future<ArticleContentModel> getArticle(int id);
}
