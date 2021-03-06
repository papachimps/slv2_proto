import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'package:flick_video_player/flick_video_player.dart';
import 'package:get/get.dart';
import 'package:slv2/views/common/constants.dart';
import 'package:video_player/video_player.dart';

class VideoPlayer extends StatefulWidget {
  static const String route = '/video';
  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

// const String VIDEO_URL =
//     'https://firebasestorage.googleapis.com/v0/b/spicemilestones.appspot.com/o/ModuleContents%2Fvideos%2FDeep%20Breathing%20low%20noise.mp4?alt=media';

class _VideoPlayerState extends State<VideoPlayer> {
  late FlickManager flickManager;
  late String moduleId;
  late Orientation orientation;
  late String moduleUrl;

  @override
  void initState() {
    super.initState();
    Map<String, dynamic> arguments = Get.arguments;
    moduleId = arguments['moduleId'];
    moduleUrl = arguments['moduleUrl'];
    orientation = arguments['orientation'];
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(moduleUrl),
    );
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    // SystemChrome.setEnabledSystemUIOverlays([
    //   SystemUiOverlay.top,
    //   SystemUiOverlay.bottom,
    // ]);
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [
        SystemUiOverlay.bottom,
        SystemUiOverlay.top,
      ],
    );
    flickManager.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  playedColor: gSpiceRed,
                  handleColor: gSpiceRed,
                  handleRadius: 8,
                  height: 4,
                ),
              ),
            ),
            preferredDeviceOrientation: handleOrientation(orientation),
            systemUIOverlay: [],
            wakelockEnabled: true,
          ),
          Positioned(
            top: 10,
            right: 0,
            child: MaterialButton(
              onPressed: () {
                // Navigator.of(context).pop();
                // Get.delete();
                Get.back();
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
