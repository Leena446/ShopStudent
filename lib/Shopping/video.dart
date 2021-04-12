import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Video extends StatefulWidget {
  static const String id = 'Video';

  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  String videoURL = 'https://www.youtube.com/watch?v=SQIbeAk-bFA';

  YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL),
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: true,
        ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(controller: _controller),
        onEnterFullScreen: () {
          SystemChrome.setPreferredOrientations(DeviceOrientation.values);
        },
        builder: (context, player) {
          return Column(
            children: [
              // some widgets
              player,
              //some other widgets
            ],
          );
        },
      ),
    );
  }
}
