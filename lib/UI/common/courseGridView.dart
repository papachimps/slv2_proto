import 'package:flutter/material.dart';
import 'package:slv2/UI/Course/courseScreen.dart';

import 'constants.dart';
import 'courseCard.dart';

class CourseGridView extends StatelessWidget {
  const CourseGridView({
    required this.coursesCount,
  });

  final int coursesCount;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: coursesCount,
      padding: EdgeInsets.symmetric(horizontal: gDefaultMargin),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: gDefaultMargin,
        mainAxisSpacing: gDefaultMargin * 2,
        mainAxisExtent: 189 * gScaleFactor + gDefaultMargin,
      ),
      itemBuilder: (BuildContext context, int index) {
        return CourseCard(
          cardIndex: index,
          courseImageUrl: getImageUrl(index),
          onPressed: () {
            print('course no. $index pressed');
            Navigator.of(context).pushNamed(CourseScreen.route);
          },
          onLongPress: () {
            print('long pressed course no. $index');
          },
        );
      },
    );
  }
}
