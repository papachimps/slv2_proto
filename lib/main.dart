import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'UI/common/constants.dart';
import '/UI/common/players/videoPlayer.dart';
import '/UI/common/players/WebViewer.dart';
import 'UI/common/players/pdfPlayer.dart';

import 'UI/Settings/settingsScreen.dart';
import 'UI/Search/searchScreen.dart';
import 'UI/Home/homeScreen.dart';
import 'UI/MyCourses/myCoursesScreen.dart';
import 'UI/Bookmarks/bookmarksScreen.dart';
import 'UI/Category/categoryScreen.dart';
import 'UI/Course/courseScreen.dart';
import 'UI/Profile/profileScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
        accentColor: gThemeOrangeColor,
        scaffoldBackgroundColor: gPrimaryWhiteBG,
        primaryTextTheme: GoogleFonts.poppinsTextTheme(),
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      initialRoute: CourseScreen.route,
      // home: (),
      routes: {
        SettingsScreen.route: (context) => SettingsScreen(),
        SearchScreen.route: (context) => SearchScreen(),
        HomeScreen.route: (context) => HomeScreen(),
        MyCoursesScreen.route: (context) => MyCoursesScreen(),
        BookmarksScreen.route: (context) => BookmarksScreen(),
        CategoryScreen.route: (context) => CategoryScreen(),
        CourseScreen.route: (context) => CourseScreen(),
        ProfileScreen.route: (context) => ProfileScreen(),
        VideoPlayer.route: (context) => VideoPlayer(),
        WebViewer.route: (context) => WebViewer(),
        PdfPlayer.route: (context) => PdfPlayer(),
      },
    );
  }
}
