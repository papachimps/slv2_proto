import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slv2/global/constants.dart';

const Color activeDotColor = const Color(0xff746768);
const Color dotColor = const Color(0xffE0E0E0);

const Color lInactiveNavIconColor = const Color(0xff9E9EAF);
const Color lActiveNavIconColor = gThemeOrangeColor;

double lDefaultMargin = gBaseMultiplier * 3; //24

Widget getMenuIcon({
  required String path,
  Color color = gPrimaryBlack,
}) =>
    SvgPicture.asset(
      path,
      color: color,
      // height: lDefaultMargin,
      // width: lDefaultMargin,
    );

Widget hamburgerMenuIcon = getMenuIcon(path: 'assets/images/hamburger.svg');
Widget searchMenuIcon = getMenuIcon(path: 'assets/images/search.svg');

Widget profileMenuIcon = getMenuIcon(
    path: 'assets/images/profile.svg', color: lInactiveNavIconColor);

Widget homeMenuIcon =
    getMenuIcon(path: 'assets/images/home.svg', color: lInactiveNavIconColor);
Widget courseMenuIcon =
    getMenuIcon(path: 'assets/images/course.svg', color: lInactiveNavIconColor);
Widget bookmarkMenuIcon = getMenuIcon(
    path: 'assets/images/bookmark.svg', color: lInactiveNavIconColor);
Widget categoryIcon = getMenuIcon(
    path: 'assets/images/category.svg', color: lInactiveNavIconColor);

TextStyle lAppBarTitleTextStyle = GoogleFonts.poppins(
  // backgroundColor: spiceRed,
  fontSize: 22 * gScaleFactor,
  color: gSpiceRed,
  fontWeight: FontWeight.w500,
  // letterSpacing: -0.2 * gScaleFactor,
  height: (1.5) * gScaleFactor,
);

TextStyle lHeadingTextStyle = GoogleFonts.poppins(
  // backgroundColor: spiceRed,
  fontSize: 24 * gScaleFactor,
  color: gHeadingTextColor,
  fontWeight: FontWeight.w600,
  letterSpacing: -0.2 * gScaleFactor,
  height: (36 / 24) * gScaleFactor,
);

TextStyle lSubHeadingTextStyle = GoogleFonts.poppins(
  fontSize: 14 * gScaleFactor,
  color: gSubHeadingTextColor,
  // backgroundColor: spiceRed,
  fontWeight: FontWeight.w500,
  height: (21 / 14) * gScaleFactor,
);

TextStyle lTitleTextStyle = GoogleFonts.poppins(
  fontSize: 14 * gScaleFactor,
  color: gTitleTextColor,
  // backgroundColor: spiceRed,
  fontWeight: FontWeight.w600,
  height: (19.6 / 14) * gScaleFactor,
);

TextStyle lSubTitleTextStyle = GoogleFonts.poppins(
  fontSize: 12 * gScaleFactor,
  color: gSubTitleTextColor,
  // backgroundColor: spiceRed,
  fontWeight: FontWeight.w400,
  height: (11.88 / 12) * gScaleFactor,
);

List<BoxShadow> lBoxShadows = [
  BoxShadow(
    color: Color(0xff111111).withOpacity(0.08),
    blurRadius: 6,
    spreadRadius: 0.1,
    offset: Offset(3, 2),
  ),
];

List<int> randIds = [Random().nextInt(100) * 24];

String getImageUrl(int index) => 'https://picsum.photos/600/400?random=$index';

// String randomImageUrl({int range = 10}) {
//   return 'https://picsum.photos/600/400?random=' +
//       Random().nextInt(range).toString();
// }