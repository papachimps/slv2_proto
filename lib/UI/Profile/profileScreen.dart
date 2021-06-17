import 'package:flutter/material.dart';
// import 'package:slv2/UI/Settings/settingsScreen.dart';

import '/UI/common/constants.dart';
import '/UI/common/bottomNavBar.dart';

import 'localConstants.dart';

// import 'components/profileAppBar.dart';

class ProfileScreen extends StatelessWidget {
  static const String route = 'profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: gPrimaryWhiteBG,
      bottomNavigationBar: BottomNavBar(activeRoute: ProfileScreen.route),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
            // size: lDefaultMargin,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              Icons.notifications_none_outlined,
              color: Colors.white,
              size: gDefaultTextMargin * 1.5,
            ),
          ),
          SizedBox(width: gDefaultMargin),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(top: 0),
        children: <Widget>[
          Image.asset(
            'assets/images/profileBG.png',
            width: double.infinity,
          ),
          // SizedBox(height: 50),
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                // height: 188 * gScaleFactor,
                // width: 300,
                // top: 10,
                child: Container(
                  height: 180 * gScaleFactor,
                  padding: EdgeInsets.all(40),
                  decoration: ShapeDecoration(
                      color: Colors.white,//gThemeOrangeColor
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(lDefaultMargin * 4),
                        topRight: Radius.circular(lDefaultMargin * 4),
                      ))),
                ),
              ),
              Positioned(
                height: lDefaultMargin * 5,
                width: lDefaultMargin * 5,
                top: -lDefaultMargin * 2.5,
                child: FloatingActionButton(
                  elevation: 64,
                  onPressed: () {},
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: lDefaultMargin * 2.5 - 2,
                    backgroundColor: gThemeOrangeColor,
                    backgroundImage: NetworkImage(randomImageUrl()),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
