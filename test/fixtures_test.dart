import 'package:flutter_test/flutter_test.dart';
import 'package:lojong/models/article_content.dart';
import 'package:lojong/models/article_summary.dart';
import 'package:lojong/models/list_result.dart';
import 'package:lojong/models/quote.dart';
import 'package:lojong/models/video.dart';

import 'fixtures/article_content.dart';
import 'fixtures/article_list.dart';
import 'fixtures/quote_list.dart';
import 'fixtures/video_list.dart';

void main() {
  group('test fixtures', () {
    test('testing $ArticleContentFixture', () async {
      final fix = ArticleContentFixture();
      await fix.init();
      expect(fix.article, isA<ArticleContentModel>());
      expect(fix.responseData, isA<Map<String, dynamic>>());
    });
    test('testing $ArticleListFixture', () async {
      final fix = ArticleListFixture();
      await fix.init();
      expect(fix.listResult, isA<ListResultModel<ArticleSummaryModel>>());
      expect(fix.responseData, isA<Map<String, dynamic>>());
    });
    test('testing $VideoListFixture', () async {
      final fix = VideoListFixture();
      await fix.init();
      expect(fix.videos, isA<List<VideoModel>>());
      expect(fix.responseData, isA<List<dynamic>>());
    });
    test('testing $QuoteListFixture', () async {
      final fix = QuoteListFixture();
      await fix.init();
      expect(fix.listResult, isA<ListResultModel<QuoteModel>>());
      expect(fix.responseData, isA<Map<String, dynamic>>());
    });
  });
}
