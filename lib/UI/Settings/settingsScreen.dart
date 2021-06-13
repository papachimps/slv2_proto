import 'package:flutter/material.dart';

import '/UI/common/constants.dart';

import 'localConstants.dart';

import 'components/settingsAppBar.dart';
import 'components/settingsTitle.dart';
import 'components/logOutButton.dart';
import 'components/logOutAlertDialog.dart';

class SettingsScreen extends StatelessWidget {
  static const String route = 'settings';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gPrimaryWhiteBG,
      appBar: settingsAppBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
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
