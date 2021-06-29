import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/controllers/course_controller.dart';
import '/views/common/constants.dart';

import '../localConstants.dart';
import 'categoryChip.dart';

class CategoriesListView extends StatelessWidget {
  final coursesController = Get.find<CoursesController>();

  void _scrollToSelectedContent(
      {required GlobalKey widgetKey, double alignment = 0.5}) {
    final keyContext = widgetKey.currentContext;
    if (keyContext != null) {
      // Future.delayed(Duration(milliseconds: 200)).then((value) {
      Scrollable.ensureVisible(
        keyContext,
        alignment: alignment,
        duration: Duration(milliseconds: 600),
        curve: Curves.ease,
      );
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    final categoriesCountMap = coursesController.getCategoryCountMap;
    var categoriesList = ['All'] + categoriesCountMap.keys.toList();
    // print(categoriesCountMap);
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(
        vertical: lDefaultMargin / 2,
        horizontal: gDefaultMargin,
      ),
      itemCount: categoriesCountMap.length,
      // shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        var category = categoriesList[index];
        final GlobalKey categoryChipKey = GlobalKey();
        return Obx(
          () => CategoryChip(
            key: categoryChipKey,
            title: category,
            isActive: category == coursesController.activeCategoryFilter.value,
            counter: category == 'All'
                ? coursesController.totalCoursesCount
                : categoriesCountMap[category],
            onPresed: () {
              _scrollToSelectedContent(widgetKey: categoryChipKey);
              coursesController
                  .setActiveCategoryFilterTo(categoriesList[index]);
              // print(coursesController.activeCategoryFilter);
            },
          ),
        );
      },
    );
  }
}
