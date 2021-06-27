import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/models/course.dart';

import '/views/Course/courseScreen.dart';

import 'constants.dart';
import 'courseCard.dart';

class CourseGridView extends StatelessWidget {
  const CourseGridView({
    required this.courses,
  });

  final List<Course> courses;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: courses.length,
      padding: EdgeInsets.symmetric(horizontal: gDefaultMargin),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: gDefaultMargin,
        mainAxisSpacing: gDefaultMargin * 2,
        mainAxisExtent: 189 * gScaleFactor + gDefaultMargin,
      ),
      itemBuilder: (BuildContext context, int index) {
        Course course = courses[index];
        return CourseCard(
          courseTitle: course.title,
          courseDate: course.formattedDate,
          courseCategory: course.categoryId,
          courseImageUrl: course.imgUrl,
          onPressed: () {
            print('course no. $index pressed');
            Get.toNamed(CourseScreen.route, arguments: course);
          },
          onLongPress: () {
            print('long pressed course no. $index');
          },
        );
      },
    );
  }
}
