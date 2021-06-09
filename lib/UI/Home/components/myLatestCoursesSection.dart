import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:slv2/global/constants.dart';

import '../localConstants.dart';

class MyLatestCoursesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: (250 + 16) * gScaleFactor,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: gDefaultMargin / 2),
          // padding: ,
          itemCount: 6,
          itemBuilder: (ctx, index) {
            return MyLatestCoursesItem(
              cardWidth: 180 * gScaleFactor,
              courseImageUrl: getImageUrl(index+6),
              cardIndex: index,
              onPressed: () {
                print('course card no. : $index pressed!');
                // ignore: todo
                //TODO: on pressing update tile
              },
            );
          }),
    );
  }
}

class MyLatestCoursesItem extends StatelessWidget {
  final int cardIndex;
  final double? cardWidth;
  final String courseImageUrl;
  // final String? heroImageTag;
  // final List<Course> courseList;
  final String courseDate;
  final String courseTitle;
  final String courseCategory;
  final VoidCallback? onPressed;

  const MyLatestCoursesItem({
    required this.cardIndex,
    this.cardWidth,
    required this.courseImageUrl,
    this.courseDate = '28 Nov',
    this.courseTitle = 'Contouring and highlighting',
    this.courseCategory = 'Grooming',
    this.onPressed,
    // this.heroImageTag,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key(cardIndex.toString()),
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
                placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(color: gThemeOrangeColor)),
                imageBuilder: (context, imageProvider) => DecoratedBox(
                  decoration: ShapeDecoration(
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(lDefaultMargin * 1.5),
                        topRight: Radius.circular(lDefaultMargin * 1.5),
                      ),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.fitHeight,
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
                  shadows: lBoxShadows,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        courseDate,
                        style: lSubTitleTextStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: gDefaultMargin / 4),
                      Text(
                        courseTitle,
                        style: lTitleTextStyle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: gDefaultMargin / 2),
                      Row(
                        children: [
                          Text(
                            courseCategory,
                            style: lSubTitleTextStyle,
                            overflow: TextOverflow.ellipsis,
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
