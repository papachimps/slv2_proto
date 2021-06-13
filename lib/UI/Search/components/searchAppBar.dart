import 'package:flutter/material.dart';

import '/UI/common/blurAppBar.dart';
import '/UI/common/searchAndFilterBlock.dart';
import '/UI/common/filtersBottomSheet.dart';

import '/UI/common/constants.dart';
import '../localConstants.dart';

import 'categoriesListView.dart';

BlurAppBar searchAppBar(BuildContext context) {
  int activeCategoryIndex = 3;
  List categoriesList = [
    'All',
    'Wellness',
    'Grooming',
    'Product & Policy',
    'Customer Service',
    'Self Development',
    'Communication',
    'Safety & Emergency',
  ];
  return BlurAppBar(
    padding: EdgeInsets.only(
      top: gDefaultMargin * 3,
    ),
    height: lAppBarHeight,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).maybePop(),
          child: Padding(
            padding: EdgeInsets.only(
              left: gDefaultMargin,
              right: gDefaultMargin,
            ),
            child: Icon(
              Icons.arrow_back_ios,
              color: gHeadingTextColor,
              // size: lDefaultMargin,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(gDefaultMargin),
          child: Padding(
            padding: EdgeInsets.only(left: gDefaultMargin / 8),
            child: Text('Search', style: gScreenHeaderStyle),
          ),
        ),
        SizedBox(
          height: gDefaultMargin * 3,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: gDefaultMargin),
            child: SearchAndFilterBlock(
              onFilterPressed: () => showModalBottomSheet(
                context: context,
                enableDrag: true,
                backgroundColor: Colors.transparent,
                builder: (context) => FiltersBottomSheet(),
              ),
            ),
          ),
        ),
        SizedBox(height: lDefaultMargin / 2),
        SizedBox(
          height: lDefaultMargin * 3,
          child: CategoriesListView(
            categoryChips: categoriesList,
            activeCategoryIndex: activeCategoryIndex,
          ),
        ),
      ],
    ),
  );
}
