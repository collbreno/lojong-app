import 'package:lojong/models/article_content.dart';
import 'package:lojong/models/article_summary.dart';
import 'package:lojong/models/quote.dart';
import 'package:lojong/models/video.dart';
import 'package:share_plus/share_plus.dart';

class ShareUtils {
  static void shareVideo(VideoModel video) {
    final buffer = StringBuffer();
    buffer
      ..write(video.description)
      ..write(' - Confira em: ')
      ..write(video.videoUrl);

    Share.share(buffer.toString());
  }

  static void shareQuote(QuoteModel quote) async {
    final buffer = StringBuffer();
    buffer
      ..write(quote.text)
      ..write(' - Confira em: ')
      ..write('http://lojong.com');

    Share.share(buffer.toString());
  }

  static void shareArticleContent(ArticleContentModel article) {
    final buffer = StringBuffer();
    buffer
      ..write(article.title)
      ..write(' - Confira em: ')
      ..write(article.url);

    Share.share(buffer.toString());
  }

  static void shareArticleSummary(ArticleSummaryModel article) {
    final buffer = StringBuffer();
    buffer
      ..write(article.text)
      ..write(' - Confira em: ')
      ..write(article.url);

    Share.share(buffer.toString());
  }
}
