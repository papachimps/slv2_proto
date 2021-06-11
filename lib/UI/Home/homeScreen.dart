import 'package:flutter/material.dart';

import '../common/constants.dart';
import './localConstants.dart';

import '../common/blurAppBar.dart';
import '../common/bottomNavBar.dart';

import '/UI/Settings/settingsScreen.dart';

import 'components/librarySection.dart';
import 'components/myLatestCoursesSection.dart';
import 'components/updatesSection.dart';

class HomeScreen extends StatelessWidget {
  static const String route = 'home';
  @override
  Widget build(BuildContext context) {
    // set [gScaleFactor] to (screen width) / (design width)
    gScaleFactor = MediaQuery.of(context).size.width / 360;
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: gPrimaryWhiteBG,
      appBar: BlurAppBar(
        padding: EdgeInsets.only(
          left: gDefaultMargin,
          top: gDefaultMargin*2.5,
          right: gDefaultMargin,
        ),
        height: gAppBarHeight,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () =>
                  Navigator.of(context).pushNamed(SettingsScreen.route),
              child: gGetMenuIcon(path: gHamburgerAppBarIcon),
            ),
            Text('SpiceLearn', style: gAppBarTitleTextStyle),
            GestureDetector(
              onTap: () =>
                  Navigator.of(context).pushNamed(SettingsScreen.route),
              child: gGetMenuIcon(path: gSearchAppBarIcon),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(activeRoute: HomeScreen.route),
      body: ListView(
        children: [
          //Updates Section
          Padding(
            padding: EdgeInsets.only(left: gDefaultTextMargin),
            child: Text(
              'Updates & Games',
              style: gHeadingTextStyle,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 2, left: gDefaultTextMargin),
            child: Text(
              'Latest events and edutainment',
              style: gSubHeadingTextStyle,
            ),
          ),
          UpdatesListBuilder(),
          //
          // SizedBox(height: 36, child: Container(color: spiceRed,),),
          //My Latest Courses
          Padding(
            padding:
                EdgeInsets.only(top: gDefaultMargin, left: gDefaultTextMargin),
            child: Text(
              'My Latest Courses',
              style: gHeadingTextStyle,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 2, left: gDefaultTextMargin, bottom: gDefaultMargin),
            child: Text(
              'Courses assigned to me',
              style: gSubHeadingTextStyle,
            ),
          ),
          MyLatestCoursesSection(),
          //
          //Library Section
          Padding(
            padding: EdgeInsets.only(
              top: lDefaultMargin,
              bottom: gDefaultMargin,
              left: gDefaultTextMargin,
            ),
            child: Text(
              'Library',
              style: gHeadingTextStyle,
            ),
          ),
          LibrarySection(),
          SizedBox(
            height: 24,
          ),
          //
        ],
      ),
    );
  }
}
