import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/views/common/constants.dart';

double lAppBarHeight = 104 * gScaleFactor;
double lDefaultMargin = gDefaultMargin2; //24

TextStyle lTabLabelTextStyle = GoogleFonts.poppins(
  fontSize: 18 * gScaleFactor,
  color: gPrimaryBlack,
  // backgroundColor: spiceRed,
  fontWeight: FontWeight.w600,
  height: (1.32) * gScaleFactor,
);

TextStyle lCourseTitleTextStyle = GoogleFonts.poppins(
  fontSize: 16 * gScaleFactor,
  color: gPrimaryBlack,
  // backgroundColor: spiceRed,
  fontWeight: FontWeight.w500,
  height: 1.32 * gScaleFactor,
);

const lLightOrangeColor = Color(0xffFFE6E2);

TextStyle lModuleTitleTextStyle = GoogleFonts.poppins(
  fontSize: 13 * gScaleFactor,
  color: gPrimaryBlack,
  fontWeight: FontWeight.w500,
  height: 1.48 * gScaleFactor,
);

TextStyle lModuleDescriptionTextStyle = GoogleFonts.poppins(
  fontSize: 13 * gScaleFactor,
  color: gSubTitleTextColor,
  fontWeight: FontWeight.w400,
  height: 1.65 * gScaleFactor,
);

enum ModuleType { Video, Web, Interactive, Doc }

Map<ModuleType, List<dynamic>> moduleTypeDict = {
  ModuleType.Doc: ['Document', Icons.library_books_outlined],
  ModuleType.Video: ['Video Module', Icons.theaters_rounded],
  ModuleType.Interactive: ['Interactive Module', Icons.note_alt_outlined],
  ModuleType.Web: ['Web Resource', Icons.web_rounded],
};
