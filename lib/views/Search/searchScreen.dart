import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/controllers/course_controller.dart';

import '/views/common/constants.dart';
import '/views/common/bottomNavBar.dart';
import '/views/common/courseGridView.dart';

import 'localConstants.dart';

import 'components/searchAppBar.dart';

class SearchScreen extends StatelessWidget {
  static const String route = '/search';
  final coursesController = Get.find<CoursesController>();

  @override
  Widget build(BuildContext context) {
    var _courses = coursesController.courses;
    coursesController.activeCategoryFilter.value = 'All';
    coursesController.searchQueryText.value = '';
    return Obx(
      () => coursesController.isLoading.value
          ? Scaffold(
              backgroundColor: gPrimaryWhiteBG,
              bottomNavigationBar: BottomNavBar(activeRoute: ''),
              body: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 1,
                  color: gThemeOrangeColor,
                ),
              ),
            )
          : Scaffold(
              extendBody: true,
              extendBodyBehindAppBar: true,
              backgroundColor: gPrimaryWhiteBG,
              bottomNavigationBar: BottomNavBar(activeRoute: ''),
              appBar: searchAppBar(
                context,
                // categoriesCountMap: coursesController.getCategoryCountMap,
              ),
              body: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Obx(
                    () {
                      var _activeCategoryFilter =
                          coursesController.activeCategoryFilter.value;
                      var coursesToDisplay =
                          coursesController.coursesFilteredBySearchQuery(
                              _activeCategoryFilter == 'All'
                                  ? _courses
                                  : coursesController.coursesFilteredByCategory(
                                      courses: _courses,
                                      filterCategory: _activeCategoryFilter,
                                    ));
                      return CourseGridView(courses: coursesToDisplay);
                    },
                  ),
                  SizedBox(height: lDefaultMargin),
                ],
              ),
            ),
    );
  }
}
