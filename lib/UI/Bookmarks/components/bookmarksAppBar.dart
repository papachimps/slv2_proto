import 'package:flutter/material.dart';
import 'package:slv2/UI/Settings/settingsScreen.dart';

import '/UI/common/blurAppBar.dart';
import '/UI/common/searchAndFilterBlock.dart';
import '/UI/common/filtersBottomSheet.dart';

import '/UI/common/constants.dart';
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
          onTap: () => Navigator.of(context).pushNamed(SettingsScreen.route),
          child: Padding(
            padding: EdgeInsets.only(
              left: gDefaultMargin,
              right: gDefaultMargin,
            ),
            child: gGetMenuIcon(path: gHamburgerAppBarIcon),
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
