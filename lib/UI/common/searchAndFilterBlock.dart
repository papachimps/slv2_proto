import 'package:flutter/material.dart';
import 'package:slv2/UI/common/constants.dart';

import '../Search/localConstants.dart';

class SearchAndFilterBlock extends StatelessWidget {
  final VoidCallback? onFilterPressed;
  const SearchAndFilterBlock({
    Key? key,
    this.onFilterPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 250,
          child: TextField(
            cursorColor: gThemeOrangeColor,
            textAlignVertical: TextAlignVertical.center,
            style: lInputFieldTextStyle.copyWith(fontWeight: FontWeight.w500),
            cursorWidth: 1,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(vertical: lDefaultMargin / 2),
                child: gGetMenuIcon(
                  path: gSearchAppBarIcon,
                  color: gSubTitleTextColor,
                  size: lDefaultMargin,
                ),
              ),
              contentPadding: EdgeInsets.only(right: lDefaultMargin / 2),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(gDefaultMargin / 4),
                borderSide: BorderSide.none,
              ),
              hintStyle: lInputFieldTextStyle,
              hintText: 'Search Courses',
              hintMaxLines: 1,
            ),
          ),
        ),
        SizedBox(width: gDefaultMargin),
        Expanded(
          flex: 50,
          child: MaterialButton(
            onPressed: onFilterPressed,
            splashColor: lChipOrangeColor.withOpacity(0.1),
            color: lFilterButtonColor,
            elevation: 0,
            highlightElevation: 2,
            highlightColor: lChipOrangeColor,
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(lDefaultMargin),
            ),
            child: Center(
              child: Icon(
                Icons.tune_rounded,
                color: Colors.white,
                size: lDefaultMargin,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
