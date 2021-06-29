import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slv2/models/course.dart';

import '/controllers/course_controller.dart';

import '/views/common/constants.dart';
import '/views/common/bottomNavBar.dart';

import 'components/myCoursesAppBar.dart';
import 'components/statusWiseCourseTabView.dart';

class MyCoursesScreen extends StatelessWidget {
  static const String route = '/mycourses';
  final coursesController = Get.find<CoursesController>();
  @override
  Widget build(BuildContext context) {
    final _courses = coursesController.courses;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: gPrimaryWhiteBG,
        bottomNavigationBar: BottomNavBar(activeRoute: MyCoursesScreen.route),
        appBar: myCoursesAppBar(context),
        body: Obx(
          () {
            if (coursesController.isLoading.isTrue)
              return Center(
                  child: CircularProgressIndicator(
                      color: gThemeOrangeColor, strokeWidth: 1));
            else
              return TabBarView(
                physics: BouncingScrollPhysics(),
                children: [
                  StatusWiseCourseTabView(
                    courses:
                        coursesController.coursesFilteredByCompletionStatus(
                      courses: _courses,
                      filterStatus:
                          enumToString((CourseCompletionStatus.OverDue)),
                    ),
                  ),
                  StatusWiseCourseTabView(
                    courses:
                        coursesController.coursesFilteredByCompletionStatus(
                      courses: _courses,
                      filterStatus:
                          enumToString((CourseCompletionStatus.Pending)),
                    ),
                  ),
                  StatusWiseCourseTabView(
                    courses:
                        coursesController.coursesFilteredByCompletionStatus(
                      courses: _courses,
                      filterStatus:
                          enumToString((CourseCompletionStatus.Completed)),
                    ),
                  ),
                ],
              );
          },
        ),
      ),
    );
  }
}
