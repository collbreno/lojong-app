import 'package:flutter/material.dart';
import 'package:lojong/models/video.dart';
import 'package:lojong/views/simple_list_view.dart';
import 'package:lojong/widgets/list_item.dart';

class VideosTab extends StatelessWidget {
  const VideosTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleListView<VideoModel>(
      itemBuilder: (video) {
        return ListItem(
          title: video.name,
          text: video.description,
          imageUrl: video.imageUrl,
          onItemPressed: () {},
          onSharePressed: () {},
          centeredIcon: _buildPlayButton(context),
        );
      },
    );
  }

  Widget _buildPlayButton(BuildContext context) {
    return Center(
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(50),
          border: const Border.fromBorderSide(
            BorderSide(
              width: 5,
              color: Colors.white,
            ),
          ),
        ),
        alignment: Alignment.center,
        child: const Icon(
          Icons.play_arrow,
          color: Colors.white,
        ),
      ),
    );
  }
}
