import 'package:flutter/material.dart';

import 'package:slv2/global/constants.dart';

import '../localConstants.dart';

class SettingsAppBar extends StatelessWidget implements PreferredSize {
  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => Size.fromHeight(gAppBarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(
        left: lDefaultMargin,
        top: lDefaultMargin,
      ),
      child: GestureDetector(
        onTap: () => Navigator.of(context).maybePop(),
        child: Icon(
          Icons.arrow_back_ios,
          color: gHeadingTextColor,
          // size: lDefaultMargin,
        ),
      ),
    );
  }
}
