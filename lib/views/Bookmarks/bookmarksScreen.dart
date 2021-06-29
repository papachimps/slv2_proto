import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/controllers/course_controller.dart';

import '/views/common/constants.dart';
import '/views/common/bottomNavBar.dart';
import '/views/common/courseGridView.dart';

import 'localConstants.dart';
import 'components/bookmarksAppBar.dart';

class BookmarksScreen extends StatelessWidget {
  static const String route = '/bookmarks';
  final coursesController = Get.find<CoursesController>();

  @override
  Widget build(BuildContext context) {
    coursesController.activeCategoryFilter.value = 'All';
    coursesController.searchQueryText.value = '';
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
          Obx(() {
            final _courses = coursesController.coursesFilteredBySearchQuery(
                coursesController.bookmarkedCourses(coursesController.courses));
            return coursesController.isLoading.isTrue
                ? Center(
                    child: CircularProgressIndicator(
                      color: gThemeOrangeColor,
                      strokeWidth: 1,
                    ),
                  )
                : CourseGridView(courses: _courses);
          }),
          SizedBox(height: lDefaultMargin),
        ],
      ),
    );
  }
}
