import 'package:flutter/material.dart';

import '/views/common/constants.dart';
import '/views/common/bottomNavBar.dart';

import '/views/Settings/settingsScreen.dart';

import 'localConstants.dart';
import 'leaderBoardScreen/leaderboardScreen.dart';
import 'editProfileScreen/editProfileScreen.dart';

// import 'components/profileAppBar.dart';

class ProfileScreen extends StatelessWidget {
  static const String route = 'profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavBar(activeRoute: ProfileScreen.route),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: EdgeInsets.only(top: lDefaultMargin / 2),
          child: IconButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(SettingsScreen.route),
            icon: gGetSvgIcon(path: gHamburgerAppBarIcon, color: gPrimaryBlack),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(top: lDefaultMargin / 2),
            child: IconButton(
              onPressed: () => Navigator.of(context).push(
                emptyMockRoute(title: 'Notifications'),
              ),
              icon: Icon(
                // Icons.more_horiz_rounded,
                Icons.notifications_none_outlined,
                color: gPrimaryBlack,
                size: gDefaultTextMargin * 1.5,
              ),
            ),
          ),
          SizedBox(width: gDefaultMargin),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          // Red Planes background
          image: DecorationImage(
            alignment: Alignment.topCenter,
            fit: BoxFit.fitWidth,
            image: AssetImage(lRedPlanesBGPath),
          ),
        ),
        child: ListView(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          children: [
            SizedBox(height: lDefaultMargin * 8),
            // User profile block
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  bottom: -lDefaultMargin * 3,
                  child: Container(
                    height: lDefaultMargin * 4,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                  ),
                ),
                //profile name and designation
                Container(
                  // height: lDefaultMargin * 12,
                  width: MediaQuery.of(context).size.width,
                  decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(lDefaultMargin * 4),
                        topRight: Radius.circular(lDefaultMargin * 4),
                      ))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: lDefaultMargin * (1 + 5 / 2),
                          bottom: gDefaultMargin / 2,
                        ),
                        child: Text(
                          'Prashant Raghav',
                          style: gScreenHeaderStyle,
                        ),
                      ),
                      Chip(
                        label: Text('Inflight Services, BOM'),
                        backgroundColor: lLightOrangeColor,
                        labelStyle: gSubHeadingTextStyle.copyWith(
                          fontSize: 13 * gScaleFactor,
                          color: gThemeOrangeColor2,
                          height: 16 / 13,
                        ),
                      ),
                      SizedBox(height: lDefaultMargin * 2),
                    ],
                  ),
                ),
                //

                //profile pic
                Positioned(
                  top: -lDefaultMargin * 5 / 2,
                  child: Container(
                    height: lDefaultMargin * 5,
                    width: lDefaultMargin * 5,
                    child: FloatingActionButton(
                      heroTag: 'Profile Pic',
                      backgroundColor: Colors.white,
                      elevation: 32,
                      onPressed: () => Navigator.of(context)
                          .pushNamed(EditProfileScreen.route),
                      child: CircleAvatar(
                        radius: lDefaultMargin * 2.5 - 2,
                        backgroundColor: gThemeOrangeColor,
                        backgroundImage: NetworkImage(getImageUrl(1)),
                      ),
                    ),
                  ),
                ),
                //
              ],
            ),
            //

            // stats, achievements, leaderboard block
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: ShapeDecoration(
                color: gPrimaryWhiteBG,
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(lDefaultMargin * 4),
                  topRight: Radius.circular(lDefaultMargin * 4),
                )),
              ),
              child: Container(
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    //stats, leaderboard, notification
                    Container(
                      // height: lDefaultMargin * 30,
                      width: MediaQuery.of(context).size.width,
                      decoration: ShapeDecoration(
                          color: gPrimaryWhiteBG,
                          shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(lDefaultMargin * 4),
                            topRight: Radius.circular(lDefaultMargin * 4),
                          ))),
                    ),
                    //

                    // stats block
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        gDefaultMargin * 2,
                        lDefaultMargin * 2,
                        0,
                        lDefaultMargin,
                      ),
                      child: Text(
                        'My Performance',
                        style: gScreenHeaderStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    WhiteCurvedBlock(
                      height: gDefaultMargin * 7,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 109,
                            child: StatBlock(
                              title: 'Points',
                              value: '202',
                              color: lPointsColor,
                            ),
                          ),
                          Container(
                            height: gDefaultMargin * 4,
                            width: 1,
                            color: lStatsDividerColor,
                          ),
                          Expanded(
                            flex: 109,
                            child: StatBlock(
                              title: 'Courses',
                              value: '88',
                              color: lCoursesColor,
                            ),
                          ),
                          Container(
                            height: gDefaultMargin * 4,
                            width: 1,
                            color: lStatsDividerColor,
                          ),
                          Expanded(
                            flex: 109,
                            child: StatBlock(
                              title: 'Rank',
                              value: '54',
                              color: lRankColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    //

                    SizedBox(height: gDefaultMargin * 2),
                    //achievements block
                    WhiteCurvedBlock(
                      height: lDefaultMargin * 9,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: gDefaultMargin,
                                  vertical: gDefaultMargin * 2,
                                ),
                                child: Text(
                                  'My Achievements',
                                  style: gScreenHeaderStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              RawMaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        lDefaultMargin * 2)),
                                padding: EdgeInsets.symmetric(
                                    horizontal: gDefaultMargin),
                                onPressed: () => Navigator.of(context).push(
                                  emptyMockRoute(title: 'My Badges List'),
                                ),
                                child: Chip(
                                  backgroundColor: gChipGreyColor,
                                  label: Text(
                                    'View All',
                                    style: gCourseCountTextStyle.copyWith(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          gGetSvgIcon(path: lMockBadgesPath),
                        ],
                      ),
                    ),
                    //

                    SizedBox(height: lDefaultMargin * 3),
                    //leaderboard block
                    Container(
                      height: lDefaultMargin * 15,
                      width: MediaQuery.of(context).size.width,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(lDefaultMargin * 4),
                          topRight: Radius.circular(lDefaultMargin * 4),
                        )),
                      ),
                      child: GestureDetector(
                        onTap: () => Navigator.of(context)
                            .pushNamed(DepartmentLeaderboardScreen.route),
                        child: Container(
                          alignment: Alignment.topRight,
                          // color: gSpiceRed,
                          child: Stack(
                            children: [
                              gGetSvgIcon(path: lMockLeaderBoardTilePath),
                              PositionedLeaderImageHolder(
                                left: lDefaultMargin * 5,
                                imageUrl: getImageUrl(2),
                              ),
                              PositionedLeaderImageHolder(
                                left: lDefaultMargin * 3,
                                imageUrl: getImageUrl(3),
                              ),
                              PositionedLeaderImageHolder(
                                left: lDefaultMargin,
                                imageUrl: getImageUrl(4),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  MaterialPageRoute<dynamic> emptyMockRoute(
      {String title = 'Some Mock route'}) {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(),
        body: Center(child: Text(title)),
      ),
    );
  }
}

class PositionedLeaderImageHolder extends StatelessWidget {
  final double? left;
  final String? imageUrl;

  const PositionedLeaderImageHolder({
    this.left,
    this.imageUrl,
  });
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      bottom: gDefaultMargin * 3,
      child: Container(
        height: lDefaultMargin * 3,
        width: lDefaultMargin * 3,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: lDefaultMargin * 1.5 - 2,
            backgroundColor: gThemeOrangeColor,
            backgroundImage: NetworkImage(imageUrl ?? getImageUrl(10)),
          ),
        ),
      ),
    );
  }
}

class StatBlock extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const StatBlock({
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: gDefaultMargin,
          height: gDefaultMargin,
          margin: EdgeInsets.only(
              right: gDefaultMargin / 2, top: gDefaultTextMargin / 2),
          decoration: BoxDecoration(
              border: Border.all(color: color, width: gDefaultMargin / 6),
              shape: BoxShape.circle),
        ),
        Container(
          // color: gSpiceRed,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(value, style: lStatValueTextStyle),
              Text(title, style: lStatTitleTextStyle)
            ],
          ),
        ),
      ],
    );
  }
}

class WhiteCurvedBlock extends StatelessWidget {
  final double height;
  final Widget? child;

  const WhiteCurvedBlock({
    required this.height,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: gDefaultMargin),
      // padding: EdgeInsets.symmetric(horizontal: gDefaultMargin),
      height: height,
      width: MediaQuery.of(context).size.width,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(lDefaultMargin * 2),
          side: BorderSide(width: 1, color: lBlockBorderColor),
        ),
        shadows: lBlockShadows,
      ),
      child: child,
    );
  }
}
