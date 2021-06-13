import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/UI/common/constants.dart';

double lAppBarHeight = 160 * gScaleFactor;
double lDefaultMargin = gBaseMultiplier * 3; //24

const lChipOrangeColor = gThemeOrangeColor2;
const lChipGreyColor = Color(0xffE3E7F2);
const lFilterButtonColor = Color(0xffBCC1CD);

const lFilterTextColor = Color(0xff7D7D93);

TextStyle lInputFieldTextStyle = GoogleFonts.poppins(
  fontSize: 14 * gScaleFactor,
  color: gSubTitleTextColor,
  // backgroundColor: spiceRed,
  fontWeight: FontWeight.w400,
  height: 1.32 * gScaleFactor,
);

TextStyle lChipTextStyle = GoogleFonts.poppins(
  fontSize: 12 * gScaleFactor,
  color: gCourseCardTitleTextColor,
  fontWeight: FontWeight.w500,
  height: 1.32 * gScaleFactor,
);

TextStyle lFilterTextStyle = GoogleFonts.poppins(
  fontSize: 17 * gScaleFactor,
  color: lFilterTextColor,
  fontWeight: FontWeight.w400,
  height: 1.32 * gScaleFactor,
);
