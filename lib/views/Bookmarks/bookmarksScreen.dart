import 'package:flutter/material.dart';

import '/views/common/constants.dart';
import '/views/common/bottomNavBar.dart';
import '/views/common/courseGridView.dart';

import 'localConstants.dart';
import 'components/bookmarksAppBar.dart';

class BookmarksScreen extends StatelessWidget {
  static const String route = 'bookmarks';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: gPrimaryWhiteBG,
      bottomNavigationBar: BottomNavBar(activeRoute: BookmarksScreen.route),
      appBar: bookmarksAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(height: lDefaultMargin),
          CourseGridView(coursesCount: 12),
          SizedBox(height: lDefaultMargin),
        ],
      ),
    );
  }
}
