import 'package:flutter/material.dart';
import 'package:trogon_learning/core/theme/app_palette.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class CustomYouTubePlayer extends StatefulWidget {
  final String url;

  const CustomYouTubePlayer({super.key, required this.url});

  @override
  State<CustomYouTubePlayer> createState() => _CustomYouTubePlayerState();
}

class _CustomYouTubePlayerState extends State<CustomYouTubePlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    final cleanedUrl = widget.url.replaceAll(r'\/', '/'); // removes escape slashes
    final videoId = YoutubePlayer.convertUrlToId(cleanedUrl);

    if (videoId != null) {
      _controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller.initialVideoId.isEmpty) {
      return const Center(child: Text('Invalid YouTube URL'));
    }

    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: AppPalette.darkPurple,
    );
  }
}
