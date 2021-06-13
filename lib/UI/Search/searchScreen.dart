import 'package:flutter/material.dart';

import '/UI/common/constants.dart';
import '/UI/common/bottomNavBar.dart';
import '/UI/common/courseGridView.dart';
import '/UI/MyCourses/myCoursesScreen.dart';

import 'localConstants.dart';

import 'components/searchAppBar.dart';

class SearchScreen extends StatelessWidget {
  static const String route = 'search';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: gPrimaryWhiteBG,
      bottomNavigationBar: BottomNavBar(activeRoute: MyCoursesScreen.route),
      appBar: searchAppBar(context),
      body: ListView(
        children: [
          CourseGridView(coursesCount: 12),
          SizedBox(height: lDefaultMargin),
        ],
      ),
    );
  }
}
