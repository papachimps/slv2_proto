import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '/views/common/constants.dart';
import '/views/common/players/videoPlayer.dart';
import '/views/common/players/WebViewer.dart';
import '/views/common/players/pdfPlayer.dart';

import '/views/Home/homeScreen.dart';
import '/views/Settings/settingsScreen.dart';
import '/views/Search/searchScreen.dart';
import '/views/MyCourses/myCoursesScreen.dart';
import '/views/Bookmarks/bookmarksScreen.dart';
import '/views/Category/categoryScreen.dart';
import '/views/Course/courseScreen.dart';
import '/views/Profile/profileScreen.dart';
import '/views/Profile/leaderBoardScreen/leaderboardScreen.dart';
import '/views/Profile/editProfileScreen/editProfileScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIOverlays([
    SystemUiOverlay.bottom,
    SystemUiOverlay.top,
  ]);
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
  //   systemNavigationBarColor: gPrimaryWhiteBG,
  //   systemNavigationBarDividerColor: gPrimaryWhiteBG,
  // ));
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
      initialRoute: HomeScreen.route,
      routes: {
        HomeScreen.route: (context) => HomeScreen(),
        SettingsScreen.route: (context) => SettingsScreen(),
        SearchScreen.route: (context) => SearchScreen(),
        MyCoursesScreen.route: (context) => MyCoursesScreen(),
        BookmarksScreen.route: (context) => BookmarksScreen(),
        CategoryScreen.route: (context) => CategoryScreen(),
        CourseScreen.route: (context) => CourseScreen(),
        ProfileScreen.route: (context) => ProfileScreen(),
        DepartmentLeaderboardScreen.route: (context) => DepartmentLeaderboardScreen(),
        EditProfileScreen.route: (context) => EditProfileScreen(),
        VideoPlayer.route: (context) => VideoPlayer(),
        WebViewer.route: (context) => WebViewer(),
        PdfPlayer.route: (context) => PdfPlayer(),
      },
    );
  }
}
