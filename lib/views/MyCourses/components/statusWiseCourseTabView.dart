import 'package:flutter/material.dart';

import '/views/common/constants.dart';
import '/views/common/courseGridView.dart';

import '../localConstants.dart';

class StatusWiseCourseTabView extends StatelessWidget {
  final int coursesCount;

  const StatusWiseCourseTabView({this.coursesCount = 11});

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
              Text('$coursesCount Courses', style: gCourseCountTextStyle),
        ),
        SizedBox(height: gDefaultMargin),
        CourseGridView(coursesCount: coursesCount),
        SizedBox(height: gAppBarHeight + gDefaultMargin * 2),
      ],
    );
  }
}
