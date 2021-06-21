import 'package:flutter/material.dart';

import '/views/common/constants.dart';
import '../localConstants.dart';

import 'editAlertDialog.dart';
import 'editProfileAppBar.dart';

class EditProfileScreen extends StatelessWidget {
  static const String route = 'edit-profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: gPrimaryWhiteBG,
      appBar: editProfileAppBar(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.all(lDefaultMargin * 2),
        child: FloatingActionButton(
          onPressed: () => showEditPicAlertDialog(
            context: context,
            confirmationAction: () => Navigator.pop(context),
          ).show(),
          backgroundColor: gFilterButtonGreyColor,
          child: Icon(
            Icons.edit,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: lDefaultMargin * 2),
            child: Hero(
              tag: 'Profile Pic',
              child: Image.network(getImageUrl(1),
                  // height: lDefaultMargin * 25,
                  fit: BoxFit.contain),
            ),
          ),
        ],
      ),
    );
  }
}
