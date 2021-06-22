import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/views/common/constants.dart';
import '/views/common/blurAppBar.dart';
import '/views/Settings/settingsScreen.dart';


import '../localConstants.dart';

BlurAppBar categoryAppBar(BuildContext context, String categoryTitle) {
  return BlurAppBar(
    padding: EdgeInsets.only(
      top: gDefaultMargin * 3,
    ),
    height: lAppBarHeight,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => Get.toNamed(SettingsScreen.route),
          child: Padding(
            padding: EdgeInsets.only(
              left: gDefaultMargin,
              right: gDefaultMargin,
            ),
            child: gGetSvgIcon(path: gHamburgerAppBarIcon, color: gPrimaryBlack),
          ),
        ),
        Container(
          padding: EdgeInsets.all(gDefaultMargin),
          alignment: Alignment.topLeft,
          child: TabBar(
            physics: BouncingScrollPhysics(),
            isScrollable: true,
            indicatorColor: gThemeOrangeColor,
            indicatorPadding: EdgeInsets.only(right: gDefaultMargin),
            indicatorWeight: gDefaultMargin / 4,
            labelColor: gPrimaryBlack,
            labelStyle: lTabLabelTextStyle,
            labelPadding: EdgeInsets.only(right: gDefaultMargin),
            unselectedLabelColor: gFilterButtonGreyColor,
            tabs: [
              Tab(text: categoryTitle),
              Tab(text: 'Leaderboard'),
            ],
          ),
        ),
      ],
    ),
  );
}
