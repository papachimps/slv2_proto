import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/controllers/course_controller.dart';

import 'constants.dart';

class SearchAndFilterBlock extends StatelessWidget {
  final VoidCallback? onFilterPressed;

  SearchAndFilterBlock({
    Key? key,
    this.onFilterPressed,
  }) : super(key: key);

  final coursesController = Get.find<CoursesController>();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 250,
          child: TextField(
            cursorColor: gThemeOrangeColor,
            onChanged: (queryText) {
              coursesController.searchQueryText.value = queryText.trim();
            },
            textAlignVertical: TextAlignVertical.center,
            style: gSearchFieldTextStyle.copyWith(fontWeight: FontWeight.w500),
            cursorWidth: 1,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(vertical: gDefaultMargin2 / 2),
                child: gGetSvgIcon(
                  path: gSearchAppBarIcon,
                  color: gSubTitleTextColor,
                  size: gDefaultMargin2,
                ),
              ),
              contentPadding: EdgeInsets.only(right: gDefaultMargin2 / 2),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(gDefaultMargin / 4),
                borderSide: BorderSide.none,
              ),
              hintStyle: gSearchFieldTextStyle,
              hintText: 'Search Courses',
              hintMaxLines: 1,
            ),
          ),
        ),
        SizedBox(width: gDefaultMargin),
        Expanded(
          flex: 50,
          child: MaterialButton(
            height: gDefaultMargin2 * 2,
            onPressed: onFilterPressed,
            splashColor: gChipOrangeColor.withOpacity(0.1),
            color: gFilterButtonGreyColor,
            elevation: 0,
            highlightElevation: 2,
            highlightColor: gChipOrangeColor,
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(gDefaultMargin2),
            ),
            child: Center(
              child: Icon(
                Icons.tune_rounded,
                color: Colors.white,
                size: gDefaultMargin2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
