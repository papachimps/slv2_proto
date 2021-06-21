import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:slv2/views/common/constants.dart';
import '../localConstants.dart';

// import '../imageCardButtonWithLabel.dart';

// import '../../provider/courses.dart';

class UpdatesListBuilder extends StatefulWidget {
  @override
  _UpdatesListBuilderState createState() => _UpdatesListBuilderState();
}

class _UpdatesListBuilderState extends State<UpdatesListBuilder> {
  // final RandomColor _randomColor = RandomColor();
  final int _pageCount = 6;
  Timer? timer;
  int _currentPage = 0;

  PageController _pageController = PageController(
    initialPage: 0,
    viewportFraction: 1,
    keepPage: true,
  );

  Timer getTimer() {
    return Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < _pageCount - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeOut,
      );
    });
  }

  void pauseOnTouch() {
    timer!.cancel();
    timer = Timer(Duration(seconds: 5), () {
      timer = getTimer();
    });
  }

  @override
  void initState() {
    super.initState();
    timer = getTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (208 + 16) * gScaleFactor,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: lDefaultMargin / 2),
          Container(
            height: 176 * gScaleFactor,
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              onPageChanged: (currPage) {
                _currentPage = currPage;
                pauseOnTouch();
              },
              itemCount: 6,
              itemBuilder: (ctx, index) {
                return UpdatesItem(
                  baseImageUrl: getImageUrl(index),
                  cardIndex: index,
                  onPressed: () {
                    print('update no. : $index pressed!');
                    // ignore: todo
                    //TODO: on pressing update tile
                  },
                );
              },
            ),
          ),
          SizedBox(height: 8),
          Container(
            child: SmoothPageIndicator(
              controller: _pageController,
              count: 6,
              effect: ScaleEffect(
                  dotHeight: 6,
                  dotWidth: 6,
                  activeDotColor: lActiveDotColor,
                  scale: 9 / 6,
                  spacing: 6,
                  dotColor: lDotColor),
            ),
          ),
        ],
      ),
    );
  }
}

class UpdatesItem extends StatelessWidget {
  final String baseImageUrl;
  final int cardIndex;
  final VoidCallback onPressed;
  // final double? cardWidth;

  const UpdatesItem({
    required this.baseImageUrl,
    required this.cardIndex,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: gDefaultMargin),
      child: GestureDetector(
        onTap: onPressed,
        child: CachedNetworkImage(
          cacheKey: baseImageUrl,
          imageUrl: baseImageUrl,
          placeholder: (context, url) => Center(
              child: CircularProgressIndicator(color: gThemeOrangeColor)),
          imageBuilder: (context, imageProvider) => DecoratedBox(
            decoration: ShapeDecoration(
              shape: ContinuousRectangleBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(gDefaultMargin * 2)),
              ),
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: imageProvider,
              ),
              shadows: gBoxShadows,
            ),
          ),
        ),
      ),
    );
  }
}
