import 'dart:convert';
import 'dart:io';
import 'package:lojong/models/article_summary.dart';
import 'package:lojong/models/list_result.dart';

class ArticleListFixture {
  late final ListResultModel<ArticleSummaryModel> listResult;
  late final Map<String, dynamic> responseData;

  Future<void> init() async {
    final file = File('test/assets/mock_list_articles.json');
    final jsonString = await file.readAsString();
    responseData = json.decode(jsonString);
    listResult = ListResultModel.fromJSON(
      responseData,
      ArticleSummaryModel.fromJSON,
    );
  }
}
