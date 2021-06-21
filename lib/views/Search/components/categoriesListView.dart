import 'dart:math';
import 'package:flutter/material.dart';

import '/views/common/constants.dart';

import '../localConstants.dart';
import 'categoryChip.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    required this.categoryChips,
    required this.activeCategoryIndex,
  });

  final List categoryChips;
  final int activeCategoryIndex;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(
        vertical: lDefaultMargin / 2,
        horizontal: gDefaultMargin,
      ),
      itemCount: categoryChips.length,
      // shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => CategoryChip(
        title: categoryChips[index],
        isActive: index == activeCategoryIndex,
        counter: Random().nextInt(30),
        onPresed: () {},
      ),
    );
  }
}
