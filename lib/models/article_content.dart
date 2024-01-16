import 'package:lojong/models/author.dart';

class ArticleContentModel {
  final int id;
  final String fullText;
  final String title;
  final String imageUrl;
  final String url;
  final AuthorModel author;

  ArticleContentModel.fromJSON(Map<String, dynamic> json)
      : id = json['id'],
        fullText = json['full_text'],
        title = json['title'],
        imageUrl = json['image_url'],
        url = json['url'],
        author = AuthorModel.fromJson(json);
}
