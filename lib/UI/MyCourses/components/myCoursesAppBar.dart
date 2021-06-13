import 'package:flutter/material.dart';

import '/UI/common/blurAppBar.dart';

import '/UI/common/constants.dart';
import '../localConstants.dart';

import '/UI/Settings/settingsScreen.dart';
import '/UI/Search/searchScreen.dart';

BlurAppBar myCoursesAppBar(BuildContext context) {
  return BlurAppBar(
    padding: EdgeInsets.only(
      left: gDefaultMargin,
      top: gDefaultMargin * 3,
      right: gDefaultMargin,
    ),
    height: lAppBarHeight,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () =>
                  Navigator.of(context).pushNamed(SettingsScreen.route),
              child: gGetMenuIcon(path: gHamburgerAppBarIcon),
            ),
            GestureDetector(
              onTap: () =>
                  Navigator.of(context).pushNamed(SearchScreen.route),
              child: gGetMenuIcon(path: gSearchAppBarIcon),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            left: lDefaultMargin / 6,
            top: gDefaultMargin,
          ),
          child: Text('My Courses', style: gScreenHeaderStyle),
        ),
        Spacer(),
        Container(
          height: lDefaultMargin * 3,
          decoration: ShapeDecoration(
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(gDefaultMargin)),
            color: lUnSelectedTabColor,
            shadows: gBoxShadows,
          ),
          child: TabBar(
            indicatorPadding:
                EdgeInsets.symmetric(horizontal: gDefaultMargin / 2),
            indicatorColor: gThemeOrangeColor,
            indicatorWeight: gDefaultMargin / 4,
            unselectedLabelColor: gSubHeadingTextColor,
            labelColor: gThemeOrangeColor,
            labelStyle: gSubHeadingTextStyle,
            tabs: [
              Tab(text: 'OverDue'),
              Tab(text: 'Pending'),
              Tab(text: 'Completed'),
            ],
          ),
        ),
        SizedBox(height: gDefaultMargin / 2),
      ],
    ),
  );
}
