import 'dart:convert';
import 'dart:io';
import 'package:lojong/models/video.dart';

class VideoListFixture {
  late final List<VideoModel> videos;
  late final List<dynamic> responseData;

  Future<void> init() async {
    final file = File('test/assets/mock_list_videos.json');
    final jsonString = await file.readAsString();
    responseData = json.decode(jsonString);
    videos = responseData.map((e) => VideoModel.fromJson(e)).toList();
  }
}
