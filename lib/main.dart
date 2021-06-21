import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return GetMaterialApp(
      title: 'Spicelearn V2_proto',
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.rightToLeftWithFade,
      theme: ThemeData(
        primaryColor: gThemeOrangeColor,
        accentColor: gThemeOrangeColor,
        scaffoldBackgroundColor: gPrimaryWhiteBG,
        primaryTextTheme: GoogleFonts.poppinsTextTheme(),
        // pageTransitionsTheme: PageTransitionsTheme(
        //   builders: {
        //     TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        //   },
        // ),
      ),
      // home: HomeScreen(),
      initialRoute: HomeScreen.route,
      // // get
      getPages: [
        GetPage(
          name: HomeScreen.route,
          page: () => HomeScreen(),
        ),
        GetPage(
          name: SettingsScreen.route,
          page: () => SettingsScreen(),
        ),
        GetPage(
          name: SearchScreen.route,
          page: () => SearchScreen(),
        ),
        GetPage(
          name: CourseScreen.route,
          page: () => CourseScreen(),
        ),
        GetPage(
          name: MyCoursesScreen.route,
          page: () => MyCoursesScreen(),
        ),
        GetPage(
          name: BookmarksScreen.route,
          page: () => BookmarksScreen(),
        ),
        GetPage(
          name: CategoryScreen.route,
          page: () => CategoryScreen(),
        ),
        GetPage(
          name: ProfileScreen.route,
          page: () => ProfileScreen(),
        ),
        GetPage(
          name: DepartmentLeaderboardScreen.route,
          page: () => DepartmentLeaderboardScreen(),
        ),
        GetPage(
          name: EditProfileScreen.route,
          page: () => EditProfileScreen(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: VideoPlayer.route,
          page: () => VideoPlayer(),
        ),
        GetPage(
          name: WebViewer.route,
          page: () => WebViewer(),
        ),
        GetPage(
          name: PdfPlayer.route,
          page: () => PdfPlayer(),
        ),
      ],
    );
  }
}
