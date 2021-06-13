import 'package:flutter/material.dart';

import '/UI/common/constants.dart';
import '/UI/common/blurAppBar.dart';
import '/UI/Settings/settingsScreen.dart';
import '/UI/common/searchAndFilterBlock.dart';
import '/UI/common/filtersBottomSheet.dart';

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
          onTap: () => Navigator.of(context).pushNamed(SettingsScreen.route),
          child: Padding(
            padding: EdgeInsets.only(
              left: gDefaultMargin,
              right: gDefaultMargin,
            ),
            child: gGetMenuIcon(path: gHamburgerAppBarIcon),
          ),
        ),
        Container(
          padding: EdgeInsets.all(gDefaultMargin),
          alignment: Alignment.topLeft,
          child: TabBar(
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
