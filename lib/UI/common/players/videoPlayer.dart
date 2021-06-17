import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';

class VideoPlayer extends StatefulWidget {
  static const String route = 'video';
  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

const String URL =
    'https://firebasestorage.googleapis.com/v0/b/spicemilestones.appspot.com/o/ModuleContents%2Fvideos%2FDeep%20Breathing%20low%20noise.mp4?alt=media';

class _VideoPlayerState extends State<VideoPlayer> {
  late Map<String, dynamic> arguments;
  late int moduleId;
  late Orientation orientation;

  late FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    // SystemChrome.setPreferredOrientations(handleOrientation);
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(URL),
    );
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setEnabledSystemUIOverlays([
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ]);
    flickManager.dispose();
    super.dispose();
  }

  List<DeviceOrientation> get handleOrientation {
    return orientation == Orientation.landscape
        ? [
            DeviceOrientation.landscapeRight,
            DeviceOrientation.landscapeLeft,
          ]
        : [DeviceOrientation.portraitUp];
  }

  @override
  Widget build(BuildContext context) {
    arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    moduleId = arguments['moduleId'];
    orientation = arguments['orientation'];

    return Scaffold(
      body: Stack(
        children: [
          FlickVideoPlayer(
            flickManager: flickManager,
            flickVideoWithControls: FlickVideoWithControls(
              videoFit: BoxFit.contain,
              controls: FlickPortraitControls(
                iconSize: 0,
                fontSize: 14,
                progressBarSettings: FlickProgressBarSettings(
                  playedColor: Color(0xffED1B23),
                  handleColor: Color(0xffED1B23),
                  handleRadius: 8,
                  height: 4,
                ),
              ),
            ),
            preferredDeviceOrientation: handleOrientation,
            systemUIOverlay: [],
            wakelockEnabled: true,
          ),
          Positioned(
            top: 10,
            right: 0,
            child: MaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              padding: EdgeInsets.zero,
              shape: CircleBorder(
                side: BorderSide(
                  color: Colors.black.withOpacity(0.9),
                  width: 1,
                ),
              ),
              height: 26,

              color: Colors.white.withOpacity(0.8),
              child: Icon(
                Icons.close_rounded,
                color: Colors.black.withOpacity(0.9),
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
