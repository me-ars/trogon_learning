import 'package:flutter/material.dart';
import 'package:vimeo_video_player/vimeo_video_player.dart'; // Make sure you use the correct package

class CustomVimeoPlayer extends StatefulWidget {
  final String url;

  const CustomVimeoPlayer({super.key, required this.url});

  @override
  State<CustomVimeoPlayer> createState() => _CustomVimeoPlayerState();
}

class _CustomVimeoPlayerState extends State<CustomVimeoPlayer> {
  late String? videoId;

  @override
  void initState() {
    super.initState();

    final cleanedUrl = widget.url.replaceAll(r'\/', '/');
    final uri = Uri.tryParse(cleanedUrl);

    if (uri != null && uri.pathSegments.isNotEmpty) {
      videoId = uri.pathSegments.last;
    } else {
      videoId = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (videoId == null) {
      return const Center(child: Text('Invalid Vimeo URL'));
    }

    return VimeoVideoPlayer(
      videoId: videoId!,
    );
  }
}
