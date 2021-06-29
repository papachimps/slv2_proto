//settings options tile component
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/views/common/constants.dart';
import '/views/common/players/webViewer.dart';

import '../localConstants.dart';

/// Use [onSettingTilePressed] method for opening the webView for respective tile
/// Update return type accordingly.
void onSettingTilePressed(BuildContext context, String routeURL) {
  routeURL != 'Feedback'
      ? Get.toNamed(WebViewer.route, arguments: {
          'moduleId': '',
          'orientation': Orientation.portrait,
          'moduleUrl': routeURL,
        })
      : Get.to(Scaffold(body: Center(child: Text('Feedback'))));
}

class SettingsTile extends StatefulWidget {
  final String title;
  final bool showToggleSwitch;
  final Function? switchToggleAction;

  const SettingsTile({
    required this.title,
    this.showToggleSwitch = false,
    this.switchToggleAction,
  });

  @override
  _SettingsTileState createState() => _SettingsTileState();
}

class _SettingsTileState extends State<SettingsTile> {
  bool switchValue = false;

  /// attach persistance [switchValue] or it will reset on every page transition.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.showToggleSwitch
          ? () {} //no action on tapping tile body if Switch avaliable
          : () {
              print('${widget.title} pressed!');
              onSettingTilePressed(
                  context, lRoutesURLMap[widget.title] ?? 'Feedback');
            },
      child: Container(
        height: gBaseMultiplier * 8,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 0.5 * gScaleFactor,
              color: gDividerColor,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: lSettingsTileTextStyle,
            ),
            widget.showToggleSwitch
                ? CupertinoSwitch(
                    value: switchValue,
                    onChanged: (bool value) {
                      print('toggleButton pressed!');
                      setState(() {
                        switchValue = value;
                      });
                      // add switch functionality here to onPressed property;
                      widget.switchToggleAction!();
                    },
                    // onChanged: (_) {},
                    activeColor: gThemeOrangeColor,
                  )
                : Icon(
                    Icons.arrow_forward_ios,
                    color: gDividerColor,
                    size: 18 * gScaleFactor,
                  ),
          ],
        ),
      ),
    );
  }
}
