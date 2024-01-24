import 'package:flutter/material.dart';
import 'package:lojong/models/video.dart';
import 'package:lojong/utils/share_utils.dart';
import 'package:lojong/views/simple_list_view.dart';
import 'package:lojong/widgets/list_item.dart';
import 'package:url_launcher/url_launcher.dart';

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
          onItemPressed: () => launchUrl(Uri.parse(video.videoUrl)),
          onSharePressed: () => ShareUtils.shareVideo(video),
          centeredIcon: _buildPlayButton(context),
        );
      },
    );
  }

  Widget _buildPlayButton(BuildContext context) {
    const buttonSize = 52.0;
    return Center(
      child: Container(
        width: buttonSize,
        height: buttonSize,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(50),
          border: Border.fromBorderSide(
            BorderSide(
              width: 5,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
        alignment: Alignment.center,
        child: Icon(
          Icons.play_arrow,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }
}
