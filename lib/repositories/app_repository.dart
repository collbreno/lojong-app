import 'package:dio/dio.dart';
import 'package:lojong/models/article_summary.dart';
import 'package:lojong/models/list_result.dart';
import 'package:lojong/models/article_content.dart';
import 'package:lojong/models/quote.dart';
import 'package:lojong/models/video.dart';
import 'package:lojong/repositories/i_app_repository.dart';

class AppRepository implements IAppRepository {
  static const _baseUrl = 'https://applojong.com/api';
  static const getArticlePath = '$_baseUrl/article-content';
  static const listArticlesPath = '$_baseUrl/articles2';
  static const listQuotesPath = '$_baseUrl/quotes2';
  static const listVideosPath = '$_baseUrl/videos';

  static const baseHeaders = {
    'Authorization':
        'Bearer O7Kw5E2embxod5YtL1h1YsGNN7FFN8wIxPYMg6J9zFjE6Th9oDssEsFLVhxf',
  };

  final Dio dio;

  AppRepository(this.dio);

  @override
  Future<ArticleContentModel> getArticle(int id) async {
    final response = await dio.get(
      getArticlePath,
      queryParameters: {'articleid': id},
    );

    return ArticleContentModel.fromJSON(response.data);
  }

  @override
  Future<ListResultModel<ArticleSummaryModel>> listArticles(int page) async {
    final response = await dio.get(
      listArticlesPath,
      queryParameters: {'page': page},
    );

    return ListResultModel.fromJSON(
        response.data, ArticleSummaryModel.fromJSON);
  }

  @override
  Future<ListResultModel<QuoteModel>> listQuotes(int page) async {
    final response = await dio.get(
      listQuotesPath,
      queryParameters: {'page': page},
    );

    return ListResultModel.fromJSON(response.data, QuoteModel.fromJSON);
  }

  @override
  Future<List<VideoModel>> listVideos() async {
    final response = await dio.get(
      listVideosPath,
    );

    return (response.data as List)
        .map((video) => VideoModel.fromJson(video))
        .toList();
  }
}
