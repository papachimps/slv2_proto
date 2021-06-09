// settings page NEW made variables, might be available in constants already.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const gPrimaryWhiteBG = Color(0xffF2F4FB);
const gPrimaryBlack = Color(0xff212523);
const Color gSpiceRed = const Color(0xffED1B23);
const gThemeOrangeColor = Color(0xFFFF7648);

const gHeadingTextColor = Color(0xff212523);
const gSubHeadingTextColor = Color(0xff88889D);
const gTitleTextColor = Color(0xff5A6175);
const gSubTitleTextColor = Color(0xff88889D);

/// [gScaleFactor] is used to convert design hard values(margin, padding, size, borders, etc)
/// into screen specific values.
double gScaleFactor = 1;

double gAppBarHeight = 64 * gScaleFactor;

double gBaseMultiplier = 8 * gScaleFactor;

double gDefaultMargin = gBaseMultiplier * 2; //16
double gDefaultTextMargin = gBaseMultiplier * 2.5; //20

TextStyle gMyCoursesHeaderStyle = GoogleFonts.poppins(
  fontSize: 18 * gScaleFactor,
  color: gHeadingTextColor,
  fontWeight: FontWeight.w600,
);
//