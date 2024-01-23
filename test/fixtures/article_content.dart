import 'dart:convert';
import 'dart:io';
import 'package:lojong/models/article_content.dart';

class ArticleContentFixture {
  late final ArticleContentModel article;
  late final Map<String, dynamic> responseData;

  Future<void> init() async {
    final file = File('test/assets/mock_get_article.json');
    final jsonString = await file.readAsString();
    responseData = json.decode(jsonString);
    article = ArticleContentModel.fromJSON(responseData);
  }
}
