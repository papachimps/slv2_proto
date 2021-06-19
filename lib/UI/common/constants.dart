import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_color/random_color.dart';

const gPrimaryWhiteBG = Color(0xffF2F4FB);
const gPrimaryBlack = Color(0xff212523);
const gSpiceRed = Color(0xffED1B23);
const gSpiceRed2 = Color(0xffF54141);
const gThemeOrangeColor = Color(0xffFF7648);
const gThemeOrangeColor2 = Color(0xffFC573B);

const gHeadingTextColor = Color(0xff212523);
const gSubHeadingTextColor = Color(0xff88889D);
const gTitleTextColor = Color(0xff5A6175);
const gSubTitleTextColor = gSubHeadingTextColor;
const gCourseCardTitleTextColor = Color(0xff4C4B68);

const gAppBarColor = Color(0xffF2F4F8);
const gDividerColor = Color(0xFFD9DCE3);

const double gBlurSigma = 10;
const double gBarOpacity = 0.80;

const Color gInactiveNavIconColor = const Color(0xff9E9EAF);

const String gBOTTOMNAVBAR_HEROTAG = 'BOTTOMNAVBAR_HEROTAG';

/// [gScaleFactor] is used to convert design hard values(margin, padding, size, borders, etc)
/// into screen specific values.
double gScaleFactor = 1;

double gAppBarHeight = 64 * gScaleFactor;

double gBaseMultiplier = 8 * gScaleFactor;

double gDefaultMargin = gBaseMultiplier * 2; //16
double gDefaultMargin2 = gBaseMultiplier * 3; //24
double gDefaultTextMargin = gBaseMultiplier * 2.5; //20

TextStyle gScreenHeaderStyle = GoogleFonts.poppins(
  fontSize: 18 * gScaleFactor,
  color: gHeadingTextColor,
  fontWeight: FontWeight.w600,
);

TextStyle gAppBarTitleTextStyle = GoogleFonts.poppins(
  // backgroundColor: gSpiceRed,
  fontSize: 22 * gScaleFactor,
  color: gSpiceRed,
  fontWeight: FontWeight.w500,
  letterSpacing: -0.2 * gScaleFactor,
  height: (0.90) * gScaleFactor,
);

TextStyle gHeadingTextStyle = GoogleFonts.poppins(
  // backgroundColor: spiceRed,
  fontSize: 24 * gScaleFactor,
  color: gHeadingTextColor,
  fontWeight: FontWeight.w600,
  letterSpacing: -0.2 * gScaleFactor,
  height: (36 / 24) * gScaleFactor,
);

TextStyle gSubHeadingTextStyle = GoogleFonts.poppins(
  fontSize: 14 * gScaleFactor,
  color: gSubHeadingTextColor,
  // backgroundColor: spiceRed,
  fontWeight: FontWeight.w500,
  height: (21 / 14) * gScaleFactor,
);

TextStyle gTitleTextStyle = GoogleFonts.poppins(
  fontSize: 14 * gScaleFactor,
  color: gTitleTextColor,
  // backgroundColor: spiceRed,
  fontWeight: FontWeight.w600,
  height: (19.6 / 14) * gScaleFactor,
);

TextStyle gSubTitleTextStyle = GoogleFonts.poppins(
  fontSize: 12 * gScaleFactor,
  color: gSubTitleTextColor,
  // backgroundColor: spiceRed,
  fontWeight: FontWeight.w400,
  height: (11.88 / 12) * gScaleFactor,
);

TextStyle gCourseCardTitleTextStyle = GoogleFonts.poppins(
  fontSize: 14 * gScaleFactor,
  color: gCourseCardTitleTextColor,
  // backgroundColor: spiceRed,
  fontWeight: FontWeight.w400,
  height: 1.32 * gScaleFactor,
);

TextStyle gCourseCountTextStyle = GoogleFonts.poppins(
  fontSize: 16 * gScaleFactor,
  color: Color(0xff4C4B68),
  // backgroundColor: spiceRed,
  fontWeight: FontWeight.w400,
  height: 1.32 * gScaleFactor,
);

const gFilterItemTextColor = Color(0xff7D7D93);
const gChipOrangeColor = gThemeOrangeColor2;
const gChipGreyColor = Color(0xffE3E7F2);
const gFilterButtonGreyColor = Color(0xffBCC1CD);

TextStyle gFilterTitleTextStyle = GoogleFonts.poppins(
  fontSize: 12 * gScaleFactor,
  color: gCourseCardTitleTextColor,
  fontWeight: FontWeight.w600,
  height: 1.32 * gScaleFactor,
);

TextStyle gFilterItemTextStyle = GoogleFonts.poppins(
  fontSize: 17 * gScaleFactor,
  color: gFilterItemTextColor,
  fontWeight: FontWeight.w400,
  height: 1.32 * gScaleFactor,
);

TextStyle gSearchFieldTextStyle = GoogleFonts.poppins(
  fontSize: 14 * gScaleFactor,
  color: gSubTitleTextColor,
  // backgroundColor: spiceRed,
  fontWeight: FontWeight.w400,
  height: 1.32 * gScaleFactor,
);

List<BoxShadow> gBoxShadows = [
  BoxShadow(
    color: Color(0xff111111).withOpacity(0.08),
    blurRadius: 6,
    spreadRadius: 0.2,
    offset: Offset(3, 2),
  ),
];

Widget gGetSvgIcon({
  required String path,
  Color? color,
  double? size,
}) =>
    SvgPicture.asset(
      path,
      color: color,
      height: size,
      width: size,
    );

//app bar
const gHamburgerAppBarIcon = 'assets/images/hamburger.svg';
const gSearchAppBarIcon = 'assets/images/search.svg';

//course card
const gCategoryIcon = 'assets/images/category.svg';

//bottom nav bar
const gHomeNavBarIcon = 'assets/images/home.svg';
const gCourseNavBarIcon = 'assets/images/course.svg';
const gBookmarkNavBarIcon = 'assets/images/bookmark.svg';
const gProfileNavBarIcon = 'assets/images/profile.svg';

final randomColor = RandomColor();
final faker = new Faker();
// List<int> randIds = [Random().nextInt(100) * 124];
String getImageUrl(int index) => 'https://picsum.photos/600/400?random=$index';

String randomImageUrl({int range = 10}) {
  return 'https://picsum.photos/600/400?random=' +
      Random().nextInt(range).toString();
}

List<DeviceOrientation> handleOrientation(Orientation orientation) {
  return orientation == Orientation.landscape
      ? [
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
        ]
      : [DeviceOrientation.portraitUp];
}


//  onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(
//               SettingsScreen.route, ModalRoute.withName(HomeScreen.route)),