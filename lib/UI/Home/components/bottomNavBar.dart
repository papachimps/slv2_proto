import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:slv2/UI/Settings/settingsScreen.dart';

import 'package:slv2/global/constants.dart';
import '../localConstants.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 6,
          sigmaY: 6,
        ),
        child: Container(
          height: 64 * gScaleFactor,
          color: Color(0xffF2F4F8).withOpacity(0.92),
          padding: EdgeInsets.symmetric(horizontal: gDefaultMargin * 2),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushNamed(SettingsScreen.route),
                child: homeMenuIcon,
              ),
              GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushNamed(SettingsScreen.route),
                child: courseMenuIcon,
              ),
              GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushNamed(SettingsScreen.route),
                child: bookmarkMenuIcon,
              ),
              GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushNamed(SettingsScreen.route),
                child: profileMenuIcon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
