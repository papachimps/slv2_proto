import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'package:slv2/UI/common/constants.dart';
import '../localConstants.dart';

var alertStyle = AlertStyle(
  alertPadding: EdgeInsets.all(2.5 * lDefaultMargin),
  overlayColor: Colors.black38,
  isCloseButton: false,
  isOverlayTapDismiss: true,
  alertBorder: ContinuousRectangleBorder(
    borderRadius: BorderRadius.circular(2 * lDefaultMargin),
    side: BorderSide(
      width: 1 * gScaleFactor,
      color: lAlertBoxBorderColor,
    ),
  ),
  buttonsDirection: ButtonsDirection.column,
  titleStyle: lAlertTitleTextStyle,
);

// Dialog Button Widget abstraction for repeated use
// used inside Alert widget
DialogButton templateDialogButton({
  required String title,
  Color color = Colors.white,
  Color titleColor = Colors.white,
  VoidCallback? onPressed,
}) =>
    DialogButton(
      height: 2 * lDefaultMargin,
      width: 148 * gScaleFactor,
      radius: BorderRadius.circular(lDefaultMargin / 2),
      color: color,
      child: Text(
        title,
        style: GoogleFonts.poppins(
          color: titleColor,
          fontSize: 16 * gScaleFactor,
        ),
      ),
      onPressed: onPressed,
    );

/// on pressing logout button; show alert box
// using rflutter_alert package for custom alert box
Alert showLogOutAlertDialog({
  required BuildContext context,
  required VoidCallback logOutConfirmationAction,
}) {
  return Alert(
    context: context,
    style: alertStyle,
    // type: AlertType.warning,
    title: "Are you sure you want \nto Log out?",
    // desc: "Are you sure you want \nto Log Out?",
    buttons: [
      templateDialogButton(
        title: "Log Out",
        color: gThemeOrangeColor,
        onPressed: logOutConfirmationAction,
      ),
      templateDialogButton(
          title: "Cancel",
          titleColor: lDialogButtonTitleColor,
          onPressed: () {
            Navigator.pop(context);
          }),
    ],
  );
}
