import 'package:flutter/material.dart';
import 'package:slv2/models/course.dart';

import '/views/common/constants.dart';
import '/views/common/courseGridView.dart';

import '../localConstants.dart';

class StatusWiseCourseTabView extends StatelessWidget {
  final List<Course> courses;

  const StatusWiseCourseTabView({required this.courses});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.only(
        top: lDefaultMargin + lAppBarHeight,
      ),
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: gDefaultTextMargin,
            top: lDefaultMargin,
          ),
          child:
              Text('${courses.length} Courses', style: gCourseCountTextStyle),
        ),
        SizedBox(height: gDefaultMargin),
        if (courses.isNotEmpty) CourseGridView(courses: courses),
        SizedBox(height: gAppBarHeight + gDefaultMargin * 2),
      ],
    );
  }
}
