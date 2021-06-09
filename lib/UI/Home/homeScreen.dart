import 'package:flutter/material.dart';

import 'package:slv2/global/constants.dart';
import './localConstants.dart';

import 'components/bottomNavBar.dart';
import 'components/home_appBar.dart';
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
      appBar: HomeAppBar(),
      bottomNavigationBar: BottomNavBar(),
      body: ListView(
        children: [
          //Updates Section
          Padding(
            padding: EdgeInsets.only(left: gDefaultTextMargin),
            child: Text(
              'Updates & Games',
              style: lHeadingTextStyle,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 2, left: gDefaultTextMargin),
            child: Text(
              'Latest events and edutainment',
              style: lSubHeadingTextStyle,
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
              style: lHeadingTextStyle,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 2, left: gDefaultTextMargin, bottom: gDefaultMargin),
            child: Text(
              'Courses assigned to me',
              style: lSubHeadingTextStyle,
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
              style: lHeadingTextStyle,
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
