import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'UI/common/constants.dart';
import '/UI/common/players/videoPlayer.dart';
import '/UI/common/players/WebViewer.dart';
import 'UI/common/players/pdfPlayer.dart';

import 'UI/Home/homeScreen.dart';
import 'UI/Settings/settingsScreen.dart';
import 'UI/Search/searchScreen.dart';
import 'UI/MyCourses/myCoursesScreen.dart';
import 'UI/Bookmarks/bookmarksScreen.dart';
import 'UI/Category/categoryScreen.dart';
import 'UI/Course/courseScreen.dart';
import 'UI/Profile/profileScreen.dart';
import 'UI/Profile/leaderBoardScreen/leaderboardScreen.dart';
import 'UI/Profile/editProfileScreen/editProfileScreen.dart';

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
      initialRoute: ProfileScreen.route,
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
