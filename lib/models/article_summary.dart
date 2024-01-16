class ArticleSummaryModel {
  final int id;
  final String text;
  final String title;
  final String imageUrl;
  final String url;

  ArticleSummaryModel.fromJSON(Map<String, dynamic> json)
      : id = json['id'],
        text = json['text'],
        title = json['title'],
        imageUrl = json['image_url'],
        url = json['url'];
}
