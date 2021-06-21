import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

import '/UI/common/constants.dart';

const String PDF_URL =
    // 'https://www.escaux.com/rsrc/EscauxCustomerDocs/DRD_T38Support_AdminGuide/T38_TEST_PAGES.pdf';
    // 'https://www.hq.nasa.gov/alsj/a17/A17_FlightPlan.pdf';
    'http://www.pdf995.com/samples/pdf.pdf';

class PdfPlayer extends StatefulWidget {
  static const String route = 'pdfview';
  @override
  PdfPlayerState createState() => PdfPlayerState();
}

class PdfPlayerState extends State<PdfPlayer> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
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
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          FutureBuilder<File>(
            future: DefaultCacheManager().getSingleFile(PDF_URL),
            builder: (context, snapshot) => snapshot.hasData
                ? PdfViewer.openFile(
                    snapshot.data!.path,
                    params: PdfViewerParams(),
                    // viewerController: pdfViewerController,
                  )
                : Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: gThemeOrangeColor,
                    ),
                  ),
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
