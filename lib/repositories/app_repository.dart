import 'package:dio/dio.dart';
import 'package:lojong/models/article_list_result.dart';
import 'package:lojong/models/article_content.dart';
import 'package:lojong/repositories/i_app_repository.dart';

class AppRepository implements IAppRepository {
  static const _baseUrl = 'https://applojong.com/api';
  static const getArticlePath = '$_baseUrl/article-content';
  static const listArticlesPath = '$_baseUrl/articles2';
  // TODO: create base options
  static const _token =
      'O7Kw5E2embxod5YtL1h1YsGNN7FFN8wIxPYMg6J9zFjE6Th9oDssEsFLVhxf';
  final Dio dio;

  AppRepository(this.dio);

  @override
  Future<ArticleContentModel> getArticle(int id) async {
    final response = await dio.get(
      getArticlePath,
      queryParameters: {'articleid': id},
      options: Options(headers: {'Authorization': 'Bearer $_token'}),
    );

    return ArticleContentModel.fromJSON(response.data);
  }

  @override
  Future<ArticleListResult> listArticles(int page) async {
    final response = await dio.get(
      listArticlesPath,
      queryParameters: {'page': page},
      options: Options(headers: {'Authorization': 'Bearer $_token'}),
    );

    return ArticleListResult.fromJSON(response.data);
  }
}
