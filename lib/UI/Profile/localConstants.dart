import 'package:flutter/material.dart';
import 'package:slv2/UI/common/constants.dart';

double lDefaultMargin = gDefaultMargin2; //24

const lLightOrangeColor = Color(0xffFFE6E2);
const lPointsColor = Color(0xff0EB45A);
const lCoursesColor = Color(0xffF37727);
const lRankColor = Color(0xffBE63F9);

const lBlockBorderColor = Color(0xffEDF0F6); 
Color lStatsDividerColor = Color(0xffE4E9F1).withOpacity(0.6); 
 
List<BoxShadow> lBlockShadows = [
  BoxShadow(
    color: Color(0xff111111).withOpacity(0.08),
    blurRadius: 16,
    spreadRadius: 0,
    offset: Offset(0, 16),
  ),
];

TextStyle lStatValueTextStyle = gScreenHeaderStyle.copyWith(
  fontSize: 24,
  fontWeight: FontWeight.w500,
  letterSpacing: -0.05,
);

TextStyle lStatTitleTextStyle = gSubHeadingTextStyle.copyWith(
  fontWeight: FontWeight.w300,
  letterSpacing: -0.01,
);

const lMockBadgesPath = 'assets/images/badges_mock.svg';
const lMockLeaderBoardTilePath = 'assets/images/leaderBoardTile.svg';
const lLeaderTileColor = Color(0xffF5E6FE);