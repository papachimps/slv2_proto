import 'package:flutter/material.dart';

import '/UI/common/constants.dart';
import '../localConstants.dart';

class CategoryChip extends StatelessWidget {
  final String title;
  final bool isActive;
  final int? counter;
  final VoidCallback? onPresed;

  const CategoryChip({
    Key? key,
    required this.title,
    this.isActive = false,
    this.counter = 0,
    this.onPresed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: gDefaultMargin / 2),
      child: MaterialButton(
        highlightElevation: 2,
        splashColor: gChipOrangeColor.withOpacity(0.1),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(lDefaultMargin * 2)),
        elevation: 0,
        padding: EdgeInsets.zero,
        minWidth: lDefaultMargin * 2.5,
        onPressed: onPresed,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: gDefaultMargin / 2,
            horizontal: gDefaultMargin,
          ),
          child: Text(
            '$title ($counter)',
            style: isActive
                ? lChipTextStyle.copyWith(color: Colors.white)
                : lChipTextStyle,
            textAlign: TextAlign.center,
          ),
        ),
        color: isActive ? gChipOrangeColor : gChipGreyColor,
      ),
    );
  }
}
