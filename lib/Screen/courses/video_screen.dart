import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatefulWidget {
  final String? id;

  VideoScreen({this.id});

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  YoutubePlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.id!,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
      ),
    );
    _controller!.toggleFullScreenMode();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        body: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: _controller!,
            showVideoProgressIndicator: true,
            onReady: () {
              print('Player is ready.');
            },
          ),
          builder: (context, player) {
            return Column(
              children: [
                player,
              ],
            );
          },
        ),
      ),
    );
  }
}
