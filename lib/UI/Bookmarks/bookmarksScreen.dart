import 'package:flutter/material.dart';

import '/UI/common/constants.dart';
import '/UI/common/bottomNavBar.dart';
import '/UI/common/courseGridView.dart';

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
        children: [
          SizedBox(height: lDefaultMargin),
          CourseGridView(coursesCount: 12),
          SizedBox(height: lDefaultMargin),
        ],
      ),
    );
  }
}
