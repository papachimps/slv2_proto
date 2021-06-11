import 'package:flutter/material.dart';
import '/UI/common/blurAppBar.dart';

import '../common/constants.dart';
import 'localConstants.dart';

import 'components/settingsTitle.dart';
import 'components/logOutButton.dart';
import 'components/logOutAlertDialog.dart';

class SettingsScreen extends StatelessWidget {
  static const String route = 'settings';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gPrimaryWhiteBG,
      appBar: BlurAppBar(
        padding: EdgeInsets.only(
          left: gDefaultMargin,
          top: gDefaultMargin * 2.5,
          right: gDefaultMargin,
        ),
        height: 104 * gScaleFactor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context).maybePop(),
              child: Icon(
                Icons.arrow_back_ios,
                color: gHeadingTextColor,
                // size: lDefaultMargin,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: lDefaultMargin / 6, top: lDefaultMargin),
              child: Text('Settings', style: gScreenHeaderStyle),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Padding(
          //   padding:
          //       EdgeInsets.only(bottom: lDefaultMargin, left: lDefaultMargin),
          //   child: Text('Settings', style: gScreenHeaderStyle),
          // ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: lDefaultMargin),
            color: Colors.white,
            child: Column(
              children: [
                SettingsTile(
                  title: 'Notifications',
                  showToggleSwitch: true,
                  switchToggleAction: () {
                    print('Extra Toggle Action Ran!');
                    // add Notifcation toggle action here
                  },
                ),
                SettingsTile(
                  title: 'Feedback',
                ),
                SettingsTile(
                  title: 'Terms & Conditions',
                ),
                SettingsTile(
                  title: 'Privacy Policy',
                ),
                SettingsTile(
                  title: 'Help',
                ),
              ],
            ),
          ),
          Spacer(),
          LogoutButton(
            onPressed: () => showLogOutAlertDialog(
              context: context,
              logOutConfirmationAction: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ).show(),
          ),
        ],
      ),
    );
  }
}
