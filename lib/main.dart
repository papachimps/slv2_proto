import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'UI/common/constants.dart';

import 'UI/Settings/settingsScreen.dart';
import 'UI/Home/homeScreen.dart';
import 'UI/MyCourses/myCoursesScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spicelearn V2_proto',
      debugShowCheckedModeBanner: false,
      scrollBehavior: CupertinoScrollBehavior(),
      theme: ThemeData(
        primaryColor: gThemeOrangeColor,
        primaryTextTheme: GoogleFonts.poppinsTextTheme(),
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      initialRoute: HomeScreen.route,
      routes: {
        SettingsScreen.route: (context) => SettingsScreen(),
        HomeScreen.route: (context) => HomeScreen(),
        MyCoursesScreen.route: (context) => MyCoursesScreen(),
      },
    );
  }
}
