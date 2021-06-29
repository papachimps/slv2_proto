import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:slv2/controllers/course_controller.dart';
import 'package:slv2/views/Category/categoryScreen.dart';
// import '/views/common/routeTransition.dart';

import '/views/common/constants.dart';
import '../localConstants.dart';
// import 'package:random_color/random_color.dart';

// RandomColor _randomColor = RandomColor();

class LibrarySection extends StatelessWidget {
  final coursesController = Get.find<CoursesController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140 * gScaleFactor,
      width: double.infinity,
      child: Obx(
        () {
          if (coursesController.isLoading.isTrue)
            return Center(
                child: CircularProgressIndicator(
                    color: gThemeOrangeColor, strokeWidth: 1));
          else
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: gDefaultMargin / 2),
              itemCount: coursesController.getListOfCategories.length,
              itemBuilder: (ctx, index) {
                var categoryId = coursesController.getListOfCategories[index];
                return LibraryItem(
                  cardWidth: 159 * gScaleFactor,
                  baseImageUrl: getImageUrl(index + 12),
                  cardIndex: index,
                  labelHeaderText: categoryId,
                  labelSubHeaderText: coursesController
                      .getCategoryCountMap[categoryId]
                      .toString(),
                  onPressed: () {
                    print('library card no. : $index pressed!');
                    // Navigator.of(context).pushNamedIfNotCurrent(CategoryScreen.route);
                    Get.toNamed(
                      CategoryScreen.route,
                      arguments: {
                        'categoryId': categoryId,
                        'courses': coursesController.coursesFilteredByCategory(
                          courses: coursesController.courses,
                          filterCategory: categoryId,
                        ),
                      },
                    );
                  },
                );
              },
            );
        },
      ),
    );
  }
}

class LibraryItem extends StatelessWidget {
  final double? cardWidth;
  final int cardIndex;
  final String baseImageUrl;
  // final List<Course> courseList;
  final double? labelContainerHeight;
  final String labelHeaderText;
  final String labelSubHeaderText;
  final VoidCallback? onPressed;
  final String? heroImageTag;
  final String? labelContainerTag;

  const LibraryItem({
    required this.baseImageUrl,
    required this.cardIndex,
    required this.cardWidth,
    required this.labelHeaderText,
    this.labelSubHeaderText = '0 Courses',
    this.labelContainerHeight,
    this.onPressed,
    this.heroImageTag,
    this.labelContainerTag,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: gDefaultMargin / 2),
      padding: EdgeInsets.only(bottom: gDefaultMargin / 2, top: 2),
      width: cardWidth,
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: onPressed,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CachedNetworkImage(
              cacheKey: baseImageUrl,
              width: cardWidth,
              height: 130 * gScaleFactor,
              imageUrl: baseImageUrl,
              placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                color: gThemeOrangeColor,
                strokeWidth: 1,
              )),
              imageBuilder: (context, imageProvider) => DecoratedBox(
                decoration: ShapeDecoration(
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(lDefaultMargin * 1.5),
                  ),
                  shadows: gBoxShadows,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: imageProvider,
                      colorFilter:
                          ColorFilter.mode(Colors.black26, BlendMode.darken)),
                ),
              ),
            ),
            Positioned(
              left: gDefaultTextMargin,
              top: gDefaultMargin,
              right: gDefaultMargin,
              child: Text(
                labelHeaderText,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: lLibraryHeaderStyle,
              ),
            ),
            Positioned(
              bottom: gDefaultMargin,
              left: gDefaultTextMargin,
              right: gDefaultMargin,
              child: Text(
                labelSubHeaderText.padLeft(2, '0') + ' Courses',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: lLibrarySubHeaderStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
