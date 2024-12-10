import 'package:flutter/material.dart';
import 'package:toktik/presentation/widgets/shared/video_buttons.dart';
import 'package:toktik/presentation/widgets/video/fullscreen_player.dart';
import 'package:toktik/presentation/widgets/video/video_background.dart';

import '../../../domain/entities/video_post.dart';

class VideoScrollableView extends StatelessWidget {

  final List<VideoPost> videos;

  const VideoScrollableView({
    super.key, 
    required this.videos
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final videoPost = videos[index];

        return Stack(
          children: [
            //Video Player
            SizedBox.expand(
              child: FullscreenPlayer(
                videoUrl: videoPost.videoUrl, 
                caption: videoPost.caption
               )
            ),
            // Gradiente
            VideoBackground(
              stops: const [0.8, 1.0],
            ),
            //botones
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(video: videoPost)
            )
            
          ],
        );
      },
    );
  }
}