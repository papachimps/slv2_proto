import 'dart:ui';
import 'package:flutter/material.dart';

import '/UI/common/constants.dart';
import '../Bookmarks/localConstants.dart';

class FiltersBottomSheet extends StatelessWidget {
  final String activeCompletionStatus = 'All';
  final String activeFilter = 'Recent';
  final String activeSortType = 'Grid';
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      clipBehavior: Clip.hardEdge,
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: gBlurSigma * 1.5,
          sigmaY: gBlurSigma * 1.5,
        ),
        child: Container(
          alignment: Alignment.topLeft,
          constraints: BoxConstraints.expand(),
          decoration: ShapeDecoration(
            color: gAppBarColor.withOpacity(gBarOpacity),
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(lDefaultMargin * 4),
                topRight: Radius.circular(lDefaultMargin * 4),
              ),
            ),
          ),
          padding: EdgeInsets.all(lDefaultMargin),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: lDefaultMargin),
              Text(
                'Status',
                style: lChipTextStyle.copyWith(fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: gDefaultMargin / 2,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FilterItem(
                      title: 'All',
                      activeField: activeCompletionStatus,
                    ),
                    FilterItem(
                      title: 'Completed',
                      activeField: activeCompletionStatus,
                    ),
                    FilterItem(
                      title: 'Pending',
                      activeField: activeCompletionStatus,
                    ),
                  ],
                ),
              ),
              SizedBox(height: lDefaultMargin),
              Text(
                'Filters',
                style: lChipTextStyle.copyWith(fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: gDefaultMargin / 2,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FilterItem(
                      title: 'Recent',
                      activeField: activeFilter,
                    ),
                    FilterItem(
                      title: 'Alphabetically',
                      activeField: activeFilter,
                    ),
                  ],
                ),
              ),
              SizedBox(height: lDefaultMargin),
              Text(
                'Sort as',
                style: lChipTextStyle.copyWith(fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: gDefaultMargin / 2,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FilterItem(
                      title: 'Grid',
                      activeField: activeSortType,
                    ),
                    FilterItem(
                      title: 'List',
                      activeField: activeSortType,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FilterItem extends StatelessWidget {
  final String title;
  final String activeField;
  final VoidCallback? onPressed;

  const FilterItem({
    required this.title,
    this.activeField = '',
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: gDefaultMargin / 4),
      child: GestureDetector(
        onTap: onPressed,
        child: Text(
          title,
          style: title == activeField
              ? lFilterTextStyle.copyWith(color: lChipOrangeColor)
              : lFilterTextStyle,
        ),
      ),
    );
  }
}
