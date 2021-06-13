import 'package:flutter/material.dart';

import '/UI/common/blurAppBar.dart';
import '/UI/common/constants.dart';

import '/UI/Settings/settingsScreen.dart';
import '/UI/Search/searchScreen.dart';

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
          child: gGetMenuIcon(path: gHamburgerAppBarIcon),
        ),
        Text('SpiceLearn', style: gAppBarTitleTextStyle),
        GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(SearchScreen.route),
          child: gGetMenuIcon(path: gSearchAppBarIcon),
        ),
      ],
    ),
  );
}
