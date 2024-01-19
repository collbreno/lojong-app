import 'package:flutter/material.dart';
import 'package:lojong/models/video.dart';
import 'package:lojong/views/simple_list_view.dart';

class VideosTab extends StatelessWidget {
  const VideosTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleListView<VideoModel>(
      itemBuilder: (video) {
        return ListTile(
          title: Text(video.name),
          subtitle: Text(video.videoUrl),
        );
      },
    );
  }
}
