import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:slv2/models/activity.dart';
import 'package:slv2/views/common/players/webViewer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '/controllers/activity_controller.dart';

import '/views/common/constants.dart';
import '../localConstants.dart';

class UpdatesListBuilder extends StatefulWidget {
  @override
  _UpdatesListBuilderState createState() => _UpdatesListBuilderState();
}

class _UpdatesListBuilderState extends State<UpdatesListBuilder> {
  final _activitiesController = Get.find<ActivityController>();
  int _pageCount = 1;
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
      child: Obx(
        () {
          if (_activitiesController.isLoading.isTrue)
            return Center(
              child: CircularProgressIndicator(
                  color: gThemeOrangeColor, strokeWidth: 1),
            );
          var _activites = _activitiesController.activities;
          _pageCount = _activites.length;
          return Column(
            children: <Widget>[
              SizedBox(height: lDefaultMargin / 2),
              Container(
                height: 176 * gScaleFactor,
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (currPage) {
                    _currentPage = currPage;
                    pauseOnTouch();
                  },
                  itemCount: _pageCount,
                  itemBuilder: (ctx, index) {
                    var _currActivity = _activites[index];
                    return UpdatesItem(
                      baseImageUrl: _activitiesController.baseUrl +
                          _currActivity.imageUrl,
                      cardIndex: index,
                      onPressed: () {
                        print('update no. : ${_currActivity.title} pressed!');
                        onActivityBeginPressed(
                          activityId: _currActivity.id,
                          activityType: _currActivity.activityType,
                          activityUrl: _currActivity.mainUrl ?? '',
                          orientation:
                              _currActivity.orientation ?? Orientation.portrait,
                        );
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: 8),
              Container(
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: _pageCount,
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
          );
        },
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
              child: CircularProgressIndicator(
            color: gThemeOrangeColor,
            strokeWidth: 1,
          )),
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

void onActivityBeginPressed(
    {required String activityId,
    ActivityType activityType = ActivityType.Message,
    Orientation orientation = Orientation.portrait,
    String activityUrl = ""}) {
  String activeUserId = '119';
  print(
      'working $orientation, $activityId, $activityType $activityUrl?id=$activeUserId');

  activityUrl.isURL
      ? Get.toNamed(WebViewer.route, arguments: {
          'moduleId': activityId,
          'orientation': orientation,
          'moduleUrl': activityUrl + '?id=$activeUserId',
        })
      : print('Activity is a message');
}
