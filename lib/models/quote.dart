class QuoteModel {
  final int id;
  final String text;
  final String author;

  QuoteModel.fromJSON(Map<String, dynamic> json)
      : id = json['id'],
        text = json['text'],
        author = json['author'];
}
