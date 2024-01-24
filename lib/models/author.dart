class AuthorModel {
  final String name;
  final String? description;
  final String? imageUrl;

  AuthorModel.fromJson(Map<String, dynamic> json)
      : name = json['author_name'],
        description = json['author_description'],
        imageUrl = json['author_image'];
}
