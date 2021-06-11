import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:slv2/UI/common/constants.dart';
import '../localConstants.dart';
// import 'package:random_color/random_color.dart';

// RandomColor _randomColor = RandomColor();

class LibrarySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140 * gScaleFactor,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: gDefaultMargin/2),
          // padding: ,
          itemCount: 6,
          itemBuilder: (ctx, index) {
            return LibraryItem(
              cardWidth: 159 * gScaleFactor,
              baseImageUrl: getImageUrl(index+12),
              cardIndex: index,
              onPressed: () {
                print('library card no. : $index pressed!');
                // ignore: todo
                //TODO: on pressing update tile
              },
            );
          }),
    );
  }
}

class LibraryItem extends StatelessWidget {
  final double? cardWidth;
  final int cardIndex;
  final String baseImageUrl;
  // final List<Course> courseList;
  final double? labelContainerHeight;
  final String? labelHeaderText;
  final String? labelSubHeaderText;
  final VoidCallback? onPressed;
  final String? heroImageTag;
  final String? labelContainerTag;

  const LibraryItem({
    required this.baseImageUrl,
    required this.cardIndex,
    required this.cardWidth,
    this.labelContainerHeight,
    this.labelHeaderText,
    this.labelSubHeaderText,
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
        child: CachedNetworkImage(
          cacheKey: baseImageUrl,
          width: cardWidth,
          height: 130 * gScaleFactor,
          imageUrl: baseImageUrl,
          placeholder: (context, url) =>
              Center(child: CircularProgressIndicator(color: gThemeOrangeColor)),
          imageBuilder: (context, imageProvider) => DecoratedBox(
            decoration: ShapeDecoration(
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(lDefaultMargin * 1.5),
              ),
              shadows: gBoxShadows,
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: imageProvider,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
