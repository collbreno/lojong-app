import 'dart:convert';
import 'dart:io';
import 'package:lojong/models/list_result.dart';
import 'package:lojong/models/quote.dart';

class QuoteListFixture {
  late final ListResultModel<QuoteModel> listResult;
  late final Map<String, dynamic> responseData;

  Future<void> init() async {
    final file = File('test/assets/mock_list_quotes.json');
    final jsonString = await file.readAsString();
    responseData = json.decode(jsonString);
    listResult = ListResultModel.fromJSON(responseData, QuoteModel.fromJSON);
  }
}
