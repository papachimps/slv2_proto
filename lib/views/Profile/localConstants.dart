import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slv2/views/common/constants.dart';

double lDefaultMargin = gDefaultMargin2; //24
double lAppBarHeight = 104 * gScaleFactor;

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
const lRedPlanesBGPath = 'assets/images/profileBG.png';

const lLeaderTileColor = Color(0xffF5E6FE);
List<BoxShadow> lLeaderBoardTileShadows = [
  BoxShadow(
    color: Color(0xff160029).withOpacity(0.16),
    blurRadius: 12,
    spreadRadius: -7,
    offset: Offset(0, 5),
  ),
];



const lDialogButtonTitleColor = Color(0xff88889D);
const lAlertBoxBorderColor = Color(0xffECEDF1);

TextStyle lSettingsTileTextStyle = GoogleFonts.poppins(
  fontSize: 13 * gScaleFactor,
  color: gHeadingTextColor,
  fontWeight: FontWeight.w400,
);

TextStyle lAlertTitleTextStyle = GoogleFonts.poppins(
  color: gHeadingTextColor,
  fontSize: 20 * gScaleFactor,
  fontWeight: FontWeight.w400,
  letterSpacing: -1 * gScaleFactor,
);

TextStyle lButtonTitleTextStyle = GoogleFonts.poppins(
  color: gThemeOrangeColor,
  fontSize: 13 * gScaleFactor,
  fontWeight: FontWeight.w400,
);

TextStyle lAlertDialogTitleTextStyle = GoogleFonts.poppins(
  color: Colors.white,
  fontSize: 16 * gScaleFactor,
);