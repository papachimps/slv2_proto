import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/models/course.dart';
import '/controllers/course_controller.dart';

import '/views/common/constants.dart';
import '/views/common/blurAppBar.dart';

import '../localConstants.dart';

final coursesController = Get.find<CoursesController>();

BlurAppBar courseAppBar(BuildContext context, {required Course course}) {
  final categoryName = course.categoryId;
  var isBookmarked = course.isCourseBookMarked.obs;
  return BlurAppBar(
    padding: EdgeInsets.only(
      left: gDefaultMargin,
      top: gDefaultMargin * 3,
      right: gDefaultMargin,
    ),
    height: lAppBarHeight,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                // onTap: () => Navigator.of(context).pop(),
                onTap: () => Get.back(),
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: gHeadingTextColor,
                  // size: lDefaultMargin,
                ),
              ),
              GestureDetector(
                onTap: () => isBookmarked.value =
                    coursesController.toggleBookmarkStatus(course.id),
                child: Obx(
                  () => Icon(
                    isBookmarked.isTrue
                        ? Icons.bookmark
                        : Icons.bookmark_add_outlined,
                    color: gHeadingTextColor,
                    size: lDefaultMargin,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(left: gDefaultMargin / 8, top: gDefaultMargin),
          child: Text(categoryName, style: gScreenHeaderStyle),
        ),
      ],
    ),
  );
}
