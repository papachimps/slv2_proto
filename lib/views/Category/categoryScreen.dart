import 'package:flutter/material.dart';

import '/views/common/constants.dart';
import '/views/common/bottomNavBar.dart';

// import 'localConstants.dart';
import 'components/categoryCoursesListing.dart';
import 'components/categoryLeaderboard.dart';
import 'components/categoryAppBar.dart';

class CategoryScreen extends StatelessWidget {
  static const String route = '/category';
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
          physics: BouncingScrollPhysics(),
          children: [
            //Category Listing
            CategoryCoursesListing(coursesCount: coursesCount),
            //Category Leaderboard
            CategoryLeaderboard(),
          ],
        ),
      ),
    );
  }
}
