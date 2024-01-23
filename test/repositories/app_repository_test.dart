import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:lojong/models/article_content.dart';
import 'package:lojong/models/article_summary.dart';
import 'package:lojong/models/list_result.dart';
import 'package:lojong/models/quote.dart';
import 'package:lojong/models/video.dart';
import 'package:lojong/repositories/app_repository.dart';

import '../fixtures/article_content.dart';
import '../fixtures/article_list.dart';
import '../fixtures/quote_list.dart';
import '../fixtures/video_list.dart';

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
      final fix = ArticleContentFixture();
      await fix.init();

      dioAdapter.onGet(AppRepository.getArticlePath, (server) {
        server.reply(200, fix.responseData);
      });

      final result = await AppRepository(dioAdapter.dio).getArticle(1);

      expect(result.id, fix.responseData['id']);
      expect(result.fullText, fix.responseData['full_text']);
      expect(result.title, fix.responseData['title']);
      expect(result.imageUrl, fix.responseData['image_url']);
      expect(result.url, fix.responseData['url']);
      expect(result.author.description, fix.responseData['author_description']);
      expect(result.author.name, fix.responseData['author_name']);
      expect(result.author.imageUrl, fix.responseData['author_image']);
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
      final fix = ArticleListFixture();
      await fix.init();

      dioAdapter.onGet(AppRepository.listArticlesPath, (server) {
        server.reply(200, fix.responseData);
      });

      final result = await AppRepository(dioAdapter.dio).listArticles(2);

      expect(result.hasMore, fix.responseData['has_more']);
      expect(result.currentPage, fix.responseData['current_page']);
      expect(result.items, isList);

      expect(result.items.first.id, fix.responseData['list'][0]['id']);
      expect(result.items.first.title, fix.responseData['list'][0]['title']);
      expect(result.items.first.text, fix.responseData['list'][0]['text']);
      expect(result.items.first.url, fix.responseData['list'][0]['url']);
      expect(
        result.items.first.imageUrl,
        fix.responseData['list'][0]['image_url'],
      );
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
      final fix = QuoteListFixture();
      await fix.init();

      dioAdapter.onGet(AppRepository.listQuotesPath, (server) {
        server.reply(200, fix.responseData);
      });

      final result = await AppRepository(dioAdapter.dio).listQuotes(99);

      expect(result.hasMore, fix.responseData['has_more']);
      expect(result.currentPage, fix.responseData['current_page']);
      expect(result.items, isList);

      expect(result.items.first.id, fix.responseData['list'][0]['id']);
      expect(result.items.first.author, fix.responseData['list'][0]['author']);
      expect(result.items.first.text, fix.responseData['list'][0]['text']);
    });
  });

  group('list videos', () {
    test('using a real Dio should return $List of $VideoModel', () async {
      final result = await AppRepository(dio).listVideos();

      expect(result, isList);
      expect(result.first, isA<VideoModel>());
    });
    test('using a mocked Dio should return the correct $List', () async {
      final fix = VideoListFixture();
      await fix.init();

      dioAdapter.onGet(AppRepository.listVideosPath, (server) {
        server.reply(200, fix.responseData);
      });

      final result = await AppRepository(dioAdapter.dio).listVideos();

      expect(result, isList);

      expect(result.first.id, fix.responseData[0]['id']);
      expect(result.first.name, fix.responseData[0]['name']);
      expect(result.first.description, fix.responseData[0]['description']);
      expect(result.first.videoUrl, fix.responseData[0]['url']);
      expect(result.first.imageUrl, fix.responseData[0]['image_url']);
    });
  });
}
