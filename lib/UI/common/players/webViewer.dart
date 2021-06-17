// import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../constants.dart';
// import 'package:webview_flutter/webview_flutter.dart';

String webURL = [
  "https://bubblegame-inflight-234if.web.app",
  "https://spicemilestones.web.app/ccso_desk_ce.html",
  "https://spicemilestones.web.app/session2021-22-inf.html",
  'https://spicemilestones.firebaseapp.com/cmd_desk_may2021.html',
  "https://spicemilestones.web.app/spicefeed-inf.html",
].last;

class WebViewer extends StatefulWidget {
  static const String route = 'webview';
  @override
  WebViewerState createState() => WebViewerState();
}

class WebViewerState extends State<WebViewer> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
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
    Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    // int moduleId = arguments['moduleId'];
    Orientation orientation = arguments['orientation'];
    SystemChrome.setPreferredOrientations(handleOrientation(orientation));
    return Scaffold(
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(url: Uri.parse(webURL)),
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
