import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

import '/UI/common/constants.dart';
import '../localConstants.dart';
import 'durationFilterButton.dart';
import 'leaderBoardListTile.dart';
import 'leaderboardAppBar.dart';

class DepartmentLeaderboardScreen extends StatelessWidget {
  static const String route = 'dept-leaderboard';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: gPrimaryWhiteBG,
      appBar: deptLeaderboardAppBar(context),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            toolbarHeight: gAppBarHeight + gDefaultMargin,
            pinned: false,
            floating: true,
            backgroundColor: gPrimaryWhiteBG,
            elevation: 0,

            //Duration Filters
            actions: [
              SizedBox(width: gDefaultMargin),
              DurationFilterButton(
                title: 'All',
                onPressed: () {},
              ),
              DurationFilterButton(
                title: 'Quarter',
                onPressed: () {},
              ),
              DurationFilterButton(
                title: 'Month',
                isSelected: true,
                onPressed: () {},
              ),
              DurationFilterButton(
                title: 'Week',
                onPressed: () {},
              ),
              Spacer(),
            ],
            // snap: false,
            // stretch: true,
            // expandedHeight: gAppBarHeight + gDefaultMargin + lAppBarHeight + 100,
            // flexibleSpace: FlexibleSpaceBar(
            //   collapseMode: CollapseMode.none,
            //   background: Container(
            //     alignment: Alignment.center,
            //     margin: EdgeInsets.only(
            //         top: gAppBarHeight + 2 * gDefaultMargin + lAppBarHeight),
            //     padding: EdgeInsets.all(lDefaultMargin),
            //     // child: gGetMenuIcon(path: 'assets/images/leaders.svg'),
            //     child: Image.asset('assets/images/leaders.png'),
            //   ),
            // ),
          ),

          //Three Musketeers
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(
                left: gDefaultMargin,
                right: gDefaultMargin,
                bottom: lDefaultMargin * 2,
              ),
              child: Image.asset('assets/images/leaders.png'),
            ),
          ),

          //LeadersList
          SliverToBoxAdapter(
            child: Container(
              decoration: ShapeDecoration(
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(gDefaultMargin * 5),
                    topRight: Radius.circular(gDefaultMargin * 5),
                  ),
                ),
                color: Colors.white,
              ),
              padding: EdgeInsets.symmetric(
                vertical: lDefaultMargin * 3,
                horizontal: gDefaultMargin,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  LeaderBoardListTile(
                    userName: faker.person.name(),
                    userRanking: Random().nextInt(100),
                    userProfileUrl: getImageUrl(123),
                    userScore: Random().nextInt(3000),
                    isCurrentUser: true,
                  ),
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 15,
                    itemBuilder: (context, index) => LeaderBoardListTile(
                      userName: faker.person.name(),
                      userRanking: index + 1,
                      userProfileUrl: getImageUrl(index),
                      userScore: Random().nextInt(3000),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
