class VideoModel {
  final int id;
  final String name;
  final String videoUrl;
  final String imageUrl;
  final String description;

  VideoModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        videoUrl = json['url'],
        imageUrl = json['image_url'],
        description = json['description'];
}
