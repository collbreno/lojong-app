import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:lojong/models/article_content.dart';
import 'package:lojong/models/article_summary.dart';
import 'package:lojong/models/list_result.dart';
import 'package:lojong/models/quote.dart';
import 'package:lojong/models/video.dart';
import 'package:lojong/repositories/app_repository.dart';

// TODO: testar os parametros recebidos
void main() {
  late Dio dio;
  late DioAdapter dioAdapter;

  setUp(() {
    dio = Dio(BaseOptions(headers: AppRepository.baseHeaders));
    dioAdapter = DioAdapter(dio: Dio());
  });

  group('get article', () {
    test('using a real Dio should return $ArticleContentModel normally',
        () async {
      final result = await AppRepository(dio).getArticle(1);

      expect(result, isA<ArticleContentModel>());
    });

    test('using a mocked Dio should return the correct $ArticleContentModel',
        () async {
      final file = File('test/assets/mock_get_article.json');
      final jsonString = await file.readAsString();
      final response = json.decode(jsonString);

      dioAdapter.onGet(AppRepository.getArticlePath, (server) {
        server.reply(200, response);
      });

      final result = await AppRepository(dioAdapter.dio).getArticle(1);

      expect(result.id, response['id']);
      expect(result.fullText, response['full_text']);
      expect(result.title, response['title']);
      expect(result.imageUrl, response['image_url']);
      expect(result.url, response['url']);
      expect(result.author.description, response['author_description']);
      expect(result.author.name, response['author_name']);
      expect(result.author.imageUrl, response['author_image']);
    });
  });

  group('list articles', () {
    test(
        'using a real Dio should return $ListResultModel of $ArticleSummaryModel',
        () async {
      final result = await AppRepository(dio).listArticles(0);

      expect(result, isA<ListResultModel>());
      expect(result.items, isList);
      expect(result.items.first, isA<ArticleSummaryModel>());
    });

    test('using a mocked Dio should return the correct $ListResultModel',
        () async {
      final file = File('test/assets/mock_list_articles.json');
      final jsonString = await file.readAsString();
      final response = json.decode(jsonString);

      dioAdapter.onGet(AppRepository.listArticlesPath, (server) {
        server.reply(200, response);
      });

      final result = await AppRepository(dioAdapter.dio).listArticles(2);

      expect(result.hasMore, response['has_more']);
      expect(result.currentPage, response['current_page']);
      expect(result.items, isList);

      expect(result.items.first.id, response['list'][0]['id']);
      expect(result.items.first.title, response['list'][0]['title']);
      expect(result.items.first.text, response['list'][0]['text']);
      expect(result.items.first.url, response['list'][0]['url']);
      expect(result.items.first.imageUrl, response['list'][0]['image_url']);
    });
  });

  group('list quotes', () {
    test('using a real Dio should return $ListResultModel of $QuoteModel',
        () async {
      final result = await AppRepository(dio).listQuotes(0);

      expect(result, isA<ListResultModel>());
      expect(result.items, isList);
      expect(result.items.first, isA<QuoteModel>());
    });
    test('using a mocked Dio should return the correct $ListResultModel',
        () async {
      final file = File('test/assets/mock_list_quotes.json');
      final jsonString = await file.readAsString();
      final response = json.decode(jsonString);

      dioAdapter.onGet(AppRepository.listQuotesPath, (server) {
        server.reply(200, response);
      });

      final result = await AppRepository(dioAdapter.dio).listQuotes(99);

      expect(result.hasMore, response['has_more']);
      expect(result.currentPage, response['current_page']);
      expect(result.items, isList);

      expect(result.items.first.id, response['list'][0]['id']);
      expect(result.items.first.author, response['list'][0]['author']);
      expect(result.items.first.text, response['list'][0]['text']);
    });
  });

  group('list videos', () {
    test('using a real Dio should return $List of $VideoModel', () async {
      final result = await AppRepository(dio).listVideos();

      expect(result, isList);
      expect(result.first, isA<VideoModel>());
    });
    test('using a mocked Dio should return the correct $List', () async {
      final file = File('test/assets/mock_list_videos.json');
      final jsonString = await file.readAsString();
      final response = json.decode(jsonString);

      dioAdapter.onGet(AppRepository.listVideosPath, (server) {
        server.reply(200, response);
      });

      final result = await AppRepository(dioAdapter.dio).listVideos();

      expect(result, isList);

      expect(result.first.id, response[0]['id']);
      expect(result.first.name, response[0]['name']);
      expect(result.first.description, response[0]['description']);
      expect(result.first.videoUrl, response[0]['url']);
      expect(result.first.imageUrl, response[0]['image_url']);
    });
  });
}
