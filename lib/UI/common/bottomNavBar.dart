import 'dart:ui';
import 'package:flutter/material.dart';
import '/UI/common/routeTransition.dart';

import 'constants.dart';

import '/UI/Home/homeScreen.dart';
import '/UI/MyCourses/myCoursesScreen.dart';
import '/UI/Bookmarks/bookmarksScreen.dart';
import '/UI/Profile/profileScreen.dart';

class BottomNavBar extends StatelessWidget {
  final String activeRoute;

  const BottomNavBar({
    this.activeRoute = HomeScreen.route,
  });
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: gBOTTOMNAVBAR_HEROTAG,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: gBlurSigma,
            sigmaY: gBlurSigma,
          ),
          child: Container(
            height: gAppBarHeight,
            decoration: BoxDecoration(
              color: gAppBarColor.withOpacity(gBarOpacity),
              border:
                  Border(top: BorderSide(color: Color(0xffF1E5E5), width: 1)),
            ),
            padding: EdgeInsets.symmetric(horizontal: gDefaultMargin * 1),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                navBarItem(
                  context: context,
                  iconPath: gHomeNavBarIcon,
                  screenRouteName: HomeScreen.route,
                  activeRoute: activeRoute,
                ),
                navBarItem(
                  context: context,
                  iconPath: gCourseNavBarIcon,
                  screenRouteName: MyCoursesScreen.route,
                  activeRoute: activeRoute,
                ),
                navBarItem(
                  context: context,
                  iconPath: gBookmarkNavBarIcon,
                  screenRouteName: BookmarksScreen.route,
                  activeRoute: activeRoute,
                ),
                navBarItem(
                  context: context,
                  iconPath: gProfileNavBarIcon,
                  screenRouteName: ProfileScreen.route,
                  activeRoute: activeRoute,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  MaterialButton navBarItem({
    required BuildContext context,
    required String screenRouteName,
    required String iconPath,
    required String activeRoute,
  }) {
    return MaterialButton(
      height: double.infinity,
      shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(gDefaultTextMargin)),
      splashColor: gThemeOrangeColor.withOpacity(0.1),
      onPressed: () =>
          Navigator.of(context).pushNamedIfNotCurrent(screenRouteName),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          gGetMenuIcon(
            path: iconPath,
            color: activeRoute == screenRouteName
                ? gThemeOrangeColor
                : gInactiveNavIconColor,
          ),
          if (activeRoute == screenRouteName)
            Container(
              margin: EdgeInsets.only(top: gDefaultMargin / 3),
              height: gDefaultMargin / 4,
              width: gDefaultMargin / 4,
              decoration: BoxDecoration(
                color: gThemeOrangeColor,
                shape: BoxShape.circle,
              ),
            )
        ],
      ),
    );
  }
}
