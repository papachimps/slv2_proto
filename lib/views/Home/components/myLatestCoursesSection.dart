import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '/controllers/course_controller.dart';
// import '/controllers/filter_controller.dart';

import '/views/common/constants.dart';
import '/views/Course/courseScreen.dart';

import '../localConstants.dart';

class MyLatestCoursesSection extends StatelessWidget {
  final _filterController = Get.find<CoursesController>();
  @override
  Widget build(BuildContext context) {
    print('built MyLatestCoursesSection');
    return Container(
      height: (250 + 16) * gScaleFactor,
      width: double.infinity,
      child: Obx(() {
        if (_filterController.isLoading.isTrue)
          return Center(
              child: CircularProgressIndicator(
                  color: gThemeOrangeColor, strokeWidth: 1));
        else {
          var recentFiveCourses = _filterController.courses;
          return ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: gDefaultMargin / 2),
              itemCount: min(5, recentFiveCourses.length),
              itemBuilder: (ctx, index) {
                var course = recentFiveCourses[index];
                return MyLatestCoursesItem(
                  cardWidth: 180 * gScaleFactor,
                  cardId: course.id,
                  courseImageUrl: course.imgUrl,
                  courseTitle: course.title,
                  courseCategory: course.categoryId,
                  courseDate: course.formattedDate.split(',').first,
                  onPressed: () {
                    print('course card no. : $index pressed!');
                    // ignore: todo
                    //TODO: on pressing update tile
                    // Navigator.of(context).pushNamed(CourseScreen.route);
                    Get.toNamed(CourseScreen.route, arguments: course);
                  },
                );
              });
        }
      }),
    );
  }
}

class MyLatestCoursesItem extends StatelessWidget {
  final String cardId;
  final double? cardWidth;
  final String courseImageUrl;
  final String courseDate;
  final String courseTitle;
  final String courseCategory;
  final VoidCallback? onPressed;

  const MyLatestCoursesItem({
    required this.cardId,
    required this.courseImageUrl,
    required this.courseDate,
    required this.courseTitle,
    required this.courseCategory,
    this.cardWidth,
    this.onPressed,
    // this.heroImageTag,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key(cardId),
      margin: EdgeInsets.symmetric(horizontal: gDefaultMargin / 2),
      padding: EdgeInsets.only(bottom: gDefaultMargin / 2, top: 2),
      width: cardWidth,
      alignment: Alignment.center,
      // color: spiceRed,
      child: GestureDetector(
        onTap: onPressed,
        child: Column(
          children: [
            Expanded(
              flex: 135,
              child: CachedNetworkImage(
                cacheKey: courseImageUrl,
                width: cardWidth,
                // height: 135 * gScaleFactor,
                imageUrl: courseImageUrl,

                placeholder: (context, url) => Container(
                    constraints: BoxConstraints.expand(),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(lDefaultMargin * 1.5),
                        topRight: Radius.circular(lDefaultMargin * 1.5),
                      )),
                    ),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: gThemeOrangeColor,
                        strokeWidth: 1,
                      ),
                    )),
                imageBuilder: (context, imageProvider) => DecoratedBox(
                  decoration: ShapeDecoration(
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(lDefaultMargin * 1.5),
                        topRight: Radius.circular(lDefaultMargin * 1.5),
                      ),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: imageProvider,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 115,
              child: Container(
                // height: 250 * gScaleFactor,
                decoration: ShapeDecoration(
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(lDefaultMargin * 1.5),
                      bottomRight: Radius.circular(lDefaultMargin * 1.5),
                    ),
                  ),
                  color: Colors.white,
                  // color: primaryBlack.withOpacity(0.1),
                  shadows: gBoxShadows,
                ),
                child: Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(
                    top: gDefaultMargin,
                    left: gDefaultMargin,
                    right: gDefaultMargin / 2,
                    bottom: gDefaultMargin,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        courseDate,
                        style: gSubTitleTextStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: gDefaultMargin / 4),
                      Text(
                        courseTitle,
                        style: gTitleTextStyle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: gDefaultMargin / 2),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          gGetSvgIcon(
                              path: gCategoryIcon,
                              color: gInactiveNavIconColor),
                          SizedBox(width: gDefaultMargin / 4),
                          Expanded(
                            child: Text(
                              courseCategory,
                              style: gSubTitleTextStyle,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
