import 'package:flutter/material.dart';

import '/views/common/constants.dart';

const Color lActiveDotColor = const Color(0xff746768);
const Color lDotColor = const Color(0xffE0E0E0);

double lDefaultMargin = gDefaultMargin2; //24

TextStyle lLibraryHeaderStyle = gScreenHeaderStyle.copyWith(
  color: Colors.white,
  fontSize: 14 * gScaleFactor,
  height: (21 / 14) * gScaleFactor,
);

TextStyle lLibrarySubHeaderStyle = gScreenHeaderStyle.copyWith(
  color: Colors.white70,
  fontSize: 12 * gScaleFactor,
  fontWeight: FontWeight.w300,
  height: (21 / 14) * gScaleFactor,
);
