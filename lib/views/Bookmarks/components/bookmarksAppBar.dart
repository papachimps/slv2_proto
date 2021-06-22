import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/views/common/constants.dart';
import '/views/common/blurAppBar.dart';
import '/views/common/searchAndFilterBlock.dart';
import '/views/common/filtersBottomSheet.dart';

import '/views/Settings/settingsScreen.dart';

import '../localConstants.dart';

BlurAppBar bookmarksAppBar(BuildContext context) {
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
          // onTap: () => Navigator.of(context).pushNamed(SettingsScreen.route),
          onTap: () => Get.toNamed(SettingsScreen.route),
          child: Padding(
            padding: EdgeInsets.only(
              left: gDefaultMargin,
              right: gDefaultMargin,
            ),
            child: gGetSvgIcon(path: gHamburgerAppBarIcon, color: gPrimaryBlack),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(gDefaultMargin),
          child: Padding(
            padding: EdgeInsets.only(left: gDefaultMargin / 8),
            child: Text('Favorites', style: gScreenHeaderStyle),
          ),
        ),
        SizedBox(
          height: gDefaultMargin * 3,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: gDefaultMargin),
            child: SearchAndFilterBlock(
              onFilterPressed: () => showModalBottomSheet(
                context: context,
                enableDrag: true,
                backgroundColor: Colors.transparent,
                builder: (context) => FiltersBottomSheet(),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
