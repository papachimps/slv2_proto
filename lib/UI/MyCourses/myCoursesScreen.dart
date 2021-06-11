import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '/UI/common/constants.dart';
import 'localConstants.dart';

import '/UI/common/blurAppBar.dart';
import '/UI/common/bottomNavBar.dart';
import '/UI/Home/homeScreen.dart';

class MyCoursesScreen extends StatelessWidget {
  static const String route = 'mycourses';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: gPrimaryWhiteBG,
        bottomNavigationBar: BottomNavBar(activeRoute: MyCoursesScreen.route),
        appBar: myCoursesAppBar(context),
        body: TabBarView(
          children: [
            CourseStatusTabView(coursesCount: 12),
            CourseStatusTabView(coursesCount: 5),
            CourseStatusTabView(coursesCount: 7),
          ],
        ),
      ),
    );
  }
}

BlurAppBar myCoursesAppBar(BuildContext context) {
  return BlurAppBar(
    padding: EdgeInsets.only(
      left: gDefaultMargin,
      top: gDefaultMargin * 2.5,
      right: gDefaultMargin,
    ),
    height: lAppBarHeight,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () =>
              Navigator.of(context).pushNamed(HomeScreen.route), //maybePop(),
          child: Icon(
            Icons.arrow_back_ios,
            color: gHeadingTextColor,
            // size: lDefaultMargin,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: lDefaultMargin / 6,
            top: gDefaultMargin,
          ),
          child: Text('My Courses', style: gScreenHeaderStyle),
        ),
        Spacer(),
        Container(
          height: lDefaultMargin * 3,
          decoration: ShapeDecoration(
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(gDefaultMargin)),
            color: lUnSelectedTabColor,
            shadows: gBoxShadows,
          ),
          child: TabBar(
            indicatorPadding:
                EdgeInsets.symmetric(horizontal: gDefaultMargin / 2),
            indicatorColor: gThemeOrangeColor,
            indicatorWeight: gDefaultMargin / 4,
            unselectedLabelColor: gSubHeadingTextColor,
            labelColor: gThemeOrangeColor,
            labelStyle: gSubHeadingTextStyle,
            tabs: [
              Tab(text: 'OverDue'),
              Tab(text: 'Pending'),
              Tab(text: 'Completed'),
            ],
          ),
        ),
        SizedBox(height: gDefaultMargin / 2),
      ],
    ),
  );
}

class CourseStatusTabView extends StatelessWidget {
  final int coursesCount;

  const CourseStatusTabView({this.coursesCount = 11});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(
        top: lDefaultMargin + lAppBarHeight,
      ),
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: gDefaultTextMargin,
            top: lDefaultMargin,
          ),
          child: Text('$coursesCount Courses', style: lCourseCountTextStyle),
        ),
        SizedBox(height: gDefaultMargin),
        GridView.builder(
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
              },
            );
          },
        ),
        SizedBox(height: gAppBarHeight + gDefaultMargin * 2),
      ],
    );
  }
}

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

  const CourseCard({
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
    return GestureDetector(
      onTap: onPressed,
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
          Expanded(
            flex: 72,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: lDefaultMargin / 2,
                    left: gDefaultMargin / 4,
                    right: gDefaultMargin / 4,
                    bottom: gDefaultMargin / 2,
                  ),
                  child: Text(
                    courseTitle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: lCourseCountTextStyle.copyWith(
                        fontSize: 14 * gScaleFactor),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: gDefaultMargin / 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        courseDate,
                        overflow: TextOverflow.ellipsis,
                        style: gSubTitleTextStyle,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: gDefaultTextMargin / 2),
                        child: Icon(
                          Icons.circle,
                          size: gDefaultMargin / 3,
                          color: gSubTitleTextColor,
                        ),
                      ),
                      Text(
                        courseCategory,
                        overflow: TextOverflow.ellipsis,
                        style: gSubTitleTextStyle,
                      ),
                    ],
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
