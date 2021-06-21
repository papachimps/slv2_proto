import 'package:flutter/material.dart';

import '/views/common/constants.dart';
import '/views/common/bottomNavBar.dart';

import 'components/myCoursesAppBar.dart';
import 'components/statusWiseCourseTabView.dart';

class MyCoursesScreen extends StatelessWidget {
  static const String route = 'mycourses';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: gPrimaryWhiteBG,
        bottomNavigationBar: BottomNavBar(activeRoute: MyCoursesScreen.route),
        appBar: myCoursesAppBar(context),
        body: TabBarView(
          physics: BouncingScrollPhysics(),
          children: [
            StatusWiseCourseTabView(coursesCount: 12),
            StatusWiseCourseTabView(coursesCount: 5),
            StatusWiseCourseTabView(coursesCount: 7),
          ],
        ),
      ),
    );
  }
}

