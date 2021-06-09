import 'package:flutter/material.dart';
import 'package:slv2/UI/Settings/localConstants.dart';

import 'package:slv2/global/constants.dart';

import 'components/settings_appBar.dart';
import 'components/settingsTitle.dart';
import 'components/logOutButton.dart';
import 'components/logOutAlertDialog.dart';

class SettingsScreen extends StatelessWidget {
  static const String route = 'settings';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gPrimaryWhiteBG,
      appBar: SettingsAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: lDefaultMargin, left: lDefaultMargin),
            child: Text('Settings', style: gMyCoursesHeaderStyle),
          ),
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
