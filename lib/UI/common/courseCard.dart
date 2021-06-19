import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'constants.dart';

class CourseCard extends StatelessWidget {
  final int cardIndex;
  final double? cardWidth;
  final String courseImageUrl;
  // final String? heroImageTag;
  // final List<Course> courseList;
  final String courseDate;
  final String courseTitle;
  final String courseCategory;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;

  const CourseCard({
    required this.cardIndex,
    this.cardWidth,
    required this.courseImageUrl,
    this.courseDate = '28 Nov',
    this.courseTitle = 'Contouring and highlighting',
    this.courseCategory = 'Grooming',
    this.onPressed,
    this.onLongPress,
    // this.heroImageTag,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      onLongPress: onLongPress,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 117,
            child: CachedNetworkImage(
              cacheKey: courseImageUrl,
              width: double.infinity,
              height: double.infinity,
              imageUrl: courseImageUrl,
              placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(color: gThemeOrangeColor)),
              imageBuilder: (context, imageProvider) => DecoratedBox(
                decoration: ShapeDecoration(
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(gDefaultMargin * 2),
                  ),
                  shadows: gBoxShadows,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: imageProvider,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 72,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: gDefaultMargin * 0.75,
                    left: gDefaultMargin / 4,
                    right: gDefaultMargin / 4,
                    bottom: gDefaultMargin / 2,
                  ),
                  child: Text(
                    courseTitle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: gCourseCardTitleTextStyle,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: gDefaultMargin / 4),
                  child: Text(
                    '$courseDate  ●  $courseCategory',
                    overflow: TextOverflow.ellipsis,
                    style: gSubTitleTextStyle,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
