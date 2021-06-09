import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:slv2/UI/Settings/settingsScreen.dart';

import 'package:slv2/global/constants.dart';
import '../localConstants.dart';

class HomeAppBar extends StatelessWidget implements PreferredSize {
  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => Size.fromHeight(gAppBarHeight);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 6,
          sigmaY: 6,
        ),
        child: Container(
          constraints: BoxConstraints.expand(),
          color: Color(0xffF2F4F8).withOpacity(0.92),
          padding: EdgeInsets.only(
            left: gDefaultMargin,
            right: gDefaultMargin,
            top: gDefaultMargin,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushNamed(SettingsScreen.route),
                child: hamburgerMenuIcon,
              ),
              Text('SpiceLearn', style: lAppBarTitleTextStyle),
              GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushNamed(SettingsScreen.route),
                child: searchMenuIcon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
