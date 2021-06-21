import 'package:flutter/material.dart';

import '/views/common/constants.dart';
import '/views/common/blurAppBar.dart';

import '/views/Settings/settingsScreen.dart';
import '/views/Search/searchScreen.dart';

BlurAppBar homeAppBar(BuildContext context) {
  return BlurAppBar(
    padding: EdgeInsets.only(
      left: gDefaultMargin,
      top: gDefaultMargin * 3,
      right: gDefaultMargin,
    ),
    height: gAppBarHeight,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(SettingsScreen.route),
          child: gGetSvgIcon(path: gHamburgerAppBarIcon, color: gPrimaryBlack),
        ),
        Text('SpiceLearn', style: gAppBarTitleTextStyle),
        GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(SearchScreen.route),
          child: gGetSvgIcon(path: gSearchAppBarIcon, color: gPrimaryBlack),
        ),
      ],
    ),
  );
}
