import 'package:flutter/material.dart';

import '/views/common/constants.dart';
import '../localConstants.dart';

//bottom logout button
class LogoutButton extends StatelessWidget {
  final VoidCallback onPressed;

  const LogoutButton({
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: MaterialButton(
        onPressed: onPressed,
        height: gAppBarHeight,
        color: Colors.white,
        splashColor: gThemeOrangeColor.withOpacity(0.1),
        minWidth: double.infinity,
        child: Center(
          child: Text(
            'Log Out',
            style: lButtonTitleTextStyle,
          ),
        ),
      ),
    );
  }
}
