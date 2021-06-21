import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/UI/common/constants.dart';

double lAppBarHeight = 136 * gScaleFactor;
double lDefaultMargin = gDefaultMargin2; //24

TextStyle lTabLabelTextStyle = GoogleFonts.poppins(
  fontSize: 18 * gScaleFactor,
  color: gPrimaryBlack,
  // backgroundColor: spiceRed,
  fontWeight: FontWeight.w600,
  height: (1.32) * gScaleFactor,
);

List<BoxShadow> lLeaderBoardTileShadows = [
  BoxShadow(
    color: Color(0xff160029).withOpacity(0.16),
    blurRadius: 12,
    spreadRadius: -7,
    offset: Offset(0, 5),
  ),
];