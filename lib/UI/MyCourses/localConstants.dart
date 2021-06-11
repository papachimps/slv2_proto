import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slv2/UI/common/constants.dart';

double lDefaultMargin = gBaseMultiplier * 3; //24
double lAppBarHeight = 180 * gScaleFactor;
const lUnSelectedTabColor = const Color(0xffFCFCFC);

TextStyle lCourseCountTextStyle = GoogleFonts.poppins(
  fontSize: 16 * gScaleFactor,
  color: Color(0xff4C4B68),
  // backgroundColor: spiceRed,
  fontWeight: FontWeight.w400,
  height: 1.32 * gScaleFactor,
);