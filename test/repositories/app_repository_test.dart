import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:lojong/models/article_content.dart';
import 'package:lojong/models/article_list_result.dart';
import 'package:lojong/repositories/app_repository.dart';

void main() {
  group('get article', () {
    test('using a real Dio should return $ArticleContentModel normally',
        () async {
      final result = await AppRepository(Dio()).getArticle(1);
      expect(result, isA<ArticleContentModel>());
    });

    test('using a mocked Dio should return the correct $ArticleContentModel',
        () async {
      final file = File('test/assets/mock_get_article.json');
      final jsonString = await file.readAsString();
      final response = json.decode(jsonString);

      final dio = Dio();
      final dioAdapter = DioAdapter(dio: dio);

      dioAdapter.onGet(AppRepository.getArticlePath, (server) {
        server.reply(200, response);
      });

      final model = await AppRepository(dio).getArticle(1);

      expect(model.id, response['id']);
      expect(model.fullText, response['full_text']);
      expect(model.title, response['title']);
      expect(model.imageUrl, response['image_url']);
      expect(model.url, response['url']);
      expect(model.author.description, response['author_description']);
      expect(model.author.name, response['author_name']);
      expect(model.author.imageUrl, response['author_image']);
    });
  });

  group('list articles', () {
    test('using a real Dio should return $ArticleListResult', () async {
      final result = await AppRepository(Dio()).listArticles(0);
      expect(result, isA<ArticleListResult>());
      expect(result.articles, isList);
    });

    test('using a mocked Dio should return the correct $ArticleListResult',
        () async {
      final file = File('test/assets/mock_list_articles.json');
      final jsonString = await file.readAsString();
      final response = json.decode(jsonString);

      final dio = Dio();
      final dioAdapter = DioAdapter(dio: dio);

      dioAdapter.onGet(AppRepository.listArticlesPath, (server) {
        server.reply(200, response);
      });

      final model = await AppRepository(dio).listArticles(0);

      expect(model.hasMore, response['has_more']);
      expect(model.currentPage, response['current_page']);
      expect(model.articles, isList);

      expect(model.articles.first.id, response['list'][0]['id']);
      expect(model.articles.first.title, response['list'][0]['title']);
      expect(model.articles.first.text, response['list'][0]['text']);
      expect(model.articles.first.url, response['list'][0]['url']);
      expect(model.articles.first.imageUrl, response['list'][0]['image_url']);
    });
  });
}
