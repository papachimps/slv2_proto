import 'package:flutter/material.dart';

import '/views/common/constants.dart';
import '/views/common/filtersBottomSheet.dart';
import '/views/common/searchAndFilterBlock.dart';
import '/views/common/courseGridView.dart';

import '../localConstants.dart';

class CategoryCoursesListing extends StatelessWidget {
  const CategoryCoursesListing({
    required this.coursesCount,
  });

  final int coursesCount;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: <Widget>[
        SliverAppBar(
          toolbarHeight: lDefaultMargin * 3,
          pinned: false,
          floating: true,
          backgroundColor: gPrimaryWhiteBG,
          elevation: 0,
          // leadingWidth: 0,
          titleSpacing: 0,
          automaticallyImplyLeading: false,
          title: Container(
            padding: EdgeInsets.symmetric(
              horizontal: gDefaultMargin,
              vertical: 0,
            ),
            child: SearchAndFilterBlock(
              onFilterPressed: () => showModalBottomSheet(
                context: context,
                enableDrag: true,
                backgroundColor: Colors.transparent,
                builder: (context) => FiltersBottomSheet(),
              ),
            ),
          ),
        ),
        SliverList(
          
          delegate: SliverChildListDelegate(
            [
              Padding(
                padding: EdgeInsets.only(
                  left: gDefaultTextMargin,
                  top: lDefaultMargin,
                ),
                child:
                    Text('$coursesCount Courses', style: gCourseCountTextStyle),
              ),
              SizedBox(height: gDefaultMargin),
              CourseGridView(coursesCount: coursesCount),
              SizedBox(height: gAppBarHeight + gDefaultMargin * 2),
            ],
          ),
        ),
      ],
    );
  }
}