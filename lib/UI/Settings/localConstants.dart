// settings page local variables, might be available in global constants already.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slv2/global/constants.dart';

double lDefaultMargin = gBaseMultiplier * 3; //24

const lDividerColor = Color(0xFFD9DCE3);
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

/// [lRoutesURLMap] is the used for mapping
const Map<String, String> lRoutesURLMap = {
  // 'Notifications':  " No url for Notifications",
  // 'Feedback' : "No url for FeedbackUI() screen",
  'Terms & Conditions':
      "https://spicelearn.inroad.in/local/staticpage/view.php?page=terms-and-conditions",
  'Privacy Policy':
      "https://spicelearn.inroad.in/local/staticpage/view.php?page=privacy-policy",
  'Help': "https://spicelearn.inroad.in/local/staticpage/view.php?page=help",
};
