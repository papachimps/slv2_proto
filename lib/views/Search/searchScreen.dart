import 'package:flutter/material.dart';

import '/views/common/constants.dart';
import '/views/common/bottomNavBar.dart';
import '/views/common/courseGridView.dart';

import 'localConstants.dart';

import 'components/searchAppBar.dart';

class SearchScreen extends StatelessWidget {
  static const String route = '/search';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: gPrimaryWhiteBG,
      bottomNavigationBar: BottomNavBar(activeRoute: ''),
      appBar: searchAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          CourseGridView(coursesCount: 12),
          SizedBox(height: lDefaultMargin),
        ],
      ),
    );
  }
}
