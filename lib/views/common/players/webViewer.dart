// import 'dart:io';
// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

import '../constants.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// String webURL = [
//   "https://bubblegame-inflight-234if.web.app",
//   "https://spicemilestones.web.app/ccso_desk_ce.html",
//   "https://spicemilestones.web.app/session2021-22-inf.html",
//   'https://spicemilestones.firebaseapp.com/cmd_desk_may2021.html',
//   "https://spicemilestones.web.app/spicefeed-inf.html",
// ].first;

class WebViewer extends StatefulWidget {
  static const String route = '/webview';
  @override
  WebViewerState createState() => WebViewerState();
}

class WebViewerState extends State<WebViewer> {
  late String moduleId;
  late Orientation orientation;
  late String moduleUrl;
  @override
  void initState() {
    Map<String, dynamic> arguments = Get.arguments;
    //moduleId = arguments['moduleId'];
    moduleUrl = arguments['moduleUrl'];
    orientation = arguments['orientation'];
    print(orientation);
    SystemChrome.setPreferredOrientations(handleOrientation(orientation));
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
    // // Enable hybrid composition.
    // if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setEnabledSystemUIOverlays([
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(url: Uri.parse(moduleUrl)),
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
