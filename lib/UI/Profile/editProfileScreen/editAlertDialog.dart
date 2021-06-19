import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '/UI/common/constants.dart';
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
  Color? titleColor,
  VoidCallback? onPressed,
}) =>
    DialogButton(
      height: 2 * lDefaultMargin,
      width: 148 * gScaleFactor,
      radius: BorderRadius.circular(lDefaultMargin / 2),
      color: color,
      child: Text(
        title,
        style: lAlertDialogTitleTextStyle.copyWith(color: titleColor),
      ),
      onPressed: onPressed,
    );

/// on pressing logout button; show alert box
// using rflutter_alert package for custom alert box
Alert showEditPicAlertDialog({
  required BuildContext context,
  required VoidCallback confirmationAction,
}) {
  return Alert(
    title: 'How would you change your profile pic?',
    context: context,
    style: alertStyle,
    type: AlertType.none,
    buttons: [
      templateDialogButton(
          title: "Delete Photo",
          titleColor: lDialogButtonTitleColor,
          onPressed: () {
            Navigator.pop(context);
          }),
      templateDialogButton(
        title: "Take Photo",
        color: gThemeOrangeColor,
        onPressed: confirmationAction,
      ),
      templateDialogButton(
          title: "Choose Photo",
          titleColor: lDialogButtonTitleColor,
          onPressed: () {
            Navigator.pop(context);
          }),
    ],
  );
}
