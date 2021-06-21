
import 'package:flutter/material.dart';

import '/UI/common/constants.dart';
import '../localConstants.dart';

class DurationFilterButton extends StatelessWidget {
  final bool isSelected;
  final VoidCallback? onPressed;
  final String title;

  const DurationFilterButton({
    this.isSelected = false,
    this.onPressed,
    this.title = 'Today',
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: lDefaultMargin / 2,
        // left: gDefaultMargin / 4,
        right: lDefaultMargin / 2,
        bottom: gDefaultTextMargin,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        elevation: 0,
        color: isSelected ? gThemeOrangeColor2 : Colors.white,
        height: gDefaultMargin * 2,
        minWidth: gDefaultMargin * 3.5,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(gDefaultMargin * 2),
        ),
        child: Text(
          title,
          style: isSelected
              ? gFilterTitleTextStyle.copyWith(color: Colors.white)
              : gFilterTitleTextStyle,
        ),
      ),
    );
  }
}
