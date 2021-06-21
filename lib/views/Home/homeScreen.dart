import 'package:flutter/material.dart';

import '/UI/common/constants.dart';
import '/UI/common/bottomNavBar.dart';

import 'localConstants.dart';
import 'components/homeAppBar.dart';
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
      appBar: homeAppBar(context),
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
            padding: EdgeInsets.only(
                left: gDefaultTextMargin, bottom: gDefaultMargin / 2),
            child: Text(
              'Latest events and edutainment',
              style: gSubHeadingTextStyle,
            ),
          ),
          UpdatesListBuilder(),
          //

          //My Latest Courses
          Padding(
            padding: EdgeInsets.only(
                top: gDefaultMargin / 2, left: gDefaultTextMargin),
            child: Text(
              'My Latest Courses',
              style: gHeadingTextStyle,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: gDefaultTextMargin, bottom: gDefaultMargin),
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
          //

          SizedBox(height: lDefaultMargin),
        ],
      ),
    );
  }
}
