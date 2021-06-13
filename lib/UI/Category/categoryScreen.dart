import 'package:flutter/material.dart';

import '/UI/common/bottomNavBar.dart';
import '/UI/common/courseGridView.dart';

import '/UI/common/constants.dart';
import 'localConstants.dart';

import 'components/categoryAppBar.dart';

class CategoryScreen extends StatelessWidget {
  static const String route = 'category';
  final String categoryTitle;
  final int coursesCount;

  const CategoryScreen({
    this.coursesCount = 12,
    this.categoryTitle = 'Grooming',
  });
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: gPrimaryWhiteBG,
        bottomNavigationBar: BottomNavBar(activeRoute: 'None'),
        appBar: categoryAppBar(context, categoryTitle),
        body: TabBarView(
          children: [
            ListView(
              padding: EdgeInsets.only(
                top: lDefaultMargin + lAppBarHeight,
              ),
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: gDefaultTextMargin,
                    top: lDefaultMargin,
                  ),
                  child: Text('$coursesCount Courses',
                      style: gCourseCountTextStyle),
                ),
                SizedBox(height: gDefaultMargin),
                CourseGridView(coursesCount: coursesCount),
                SizedBox(height: gAppBarHeight + gDefaultMargin * 2),
              ],
            ),
            Center(
              child: Text('LeaderBoard'),
            ),
          ],
        ),
      ),
    );
  }
}
