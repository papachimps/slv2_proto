import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/models/course.dart';

import '/controllers/course_controller.dart';

import '/views/common/constants.dart';
import '/views/common/bottomNavBar.dart';

// import 'localConstants.dart';
import 'components/categoryCoursesListing.dart';
import 'components/categoryLeaderboard.dart';
import 'components/categoryAppBar.dart';

class CategoryScreen extends StatelessWidget {
  static const String route = '/category';
  final coursesController = Get.find<CoursesController>();

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments = Get.arguments;
    final String categoryId = arguments['categoryId'];
    final List<Course> _courses = arguments['courses'];

    coursesController.activeCategoryFilter.value = categoryId;
    coursesController.searchQueryText.value = '';

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: gPrimaryWhiteBG,
        bottomNavigationBar: BottomNavBar(activeRoute: 'None'),
        appBar: categoryAppBar(context, categoryId),
        body: TabBarView(
          physics: BouncingScrollPhysics(),
          children: [
            //Category Listing
            Obx(
              () => CategoryCoursesListing(
                  courses:
                      coursesController.coursesFilteredBySearchQuery(_courses)),
            ),
            //Category Leaderboard
            CategoryLeaderboard(),
          ],
        ),
      ),
    );
  }
}
