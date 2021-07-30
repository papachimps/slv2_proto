import 'dart:convert';
import 'package:get/state_manager.dart';

import '/services/networkservice.dart';
import '/models/course.dart';

class CoursesController extends GetxController {
  final networkService = NetworkService();
  final courses = <Course>[].obs;
  final isLoading = true.obs;
  final RxString activeCategoryFilter = 'All'.obs;
  final RxString searchQueryText = ''.obs;

  @override
  void onInit() {
    // networkService.postData(coursesToJson([
    //   course1,
    //   course2,
    //   course3,
    //   course4,
    //   course5,
    //   course6,
    // ]));
    fetchCourses();
    super.onInit();
  }

// convert list of course objects to Json string
  String coursesToJson(List<Course> coursesList) =>
      json.encode(courseListToMap(coursesList));

/// fetch courses form network and fill into [courses] variable
  Future fetchCourses() async {
    final jsonResponse = await networkService.getData();
    final _coursesListMap = json.decode(jsonResponse);
    courses.addAll(courseListFromMap(_coursesListMap));
    coursesSortedByRecent();
    courses.forEach((element) => print([element.title, element.lastUpdatedAt]));
    isLoading.toggle();
  }

// get total courses count
  int get totalCoursesCount => courses.length;

// get total user score in courses
  int get totalUserScore => courses.fold(
      0, (previousValue, element) => previousValue + element.userScore.toInt());

// get courses by their title
  List<Course> coursesFilteredBySearchQuery(List<Course> courses) {
    return searchQueryText.value == ''
        ? courses
        : courses
            .where((course) =>
                course.title.toLowerCase().contains(searchQueryText))
            .toList();
  }

// set Active CategoryFilter To provided categoryId
  void setActiveCategoryFilterTo(String newCategory) =>
      activeCategoryFilter.value = newCategory;

// get bookmarkedCourses
  List<Course> bookmarkedCourses(List<Course> courses) {
    List<Course> _bookmarkList = [];
    for (Course course in courses)
      if (course.isCourseBookMarked) _bookmarkList.add(course);
    return _bookmarkList;
  }

// toggle bookMark status of provided course
  bool toggleBookmarkStatus(String courseId) {
    var _course = courses.firstWhere((course) => course.id == courseId);
    _course.isCourseBookMarked = !_course.isCourseBookMarked;
    return _course.isCourseBookMarked;
  }

// get courses list sorted by their DateTime.
  void coursesSortedByRecent() =>
      courses.sort((a, b) => (b.lastUpdatedAt).compareTo(a.lastUpdatedAt));
  // _courses.forEach((element) => print([element.title, element.lastUpdatedAt]));

// get courses list sorted by their Title.
  void coursesSortedByTitle(List<Course> courses) =>
      courses.sort((a, b) => (a.title).compareTo(b.title));

// get courses list filtered by provided Category.
  List<Course> coursesFilteredByCategory(
          {required List<Course> courses, required String filterCategory}) =>
      courses.where((course) => course.categoryId == filterCategory).toList();

// get courses list filtered by their Completion Status.
  List<Course> coursesFilteredByCompletionStatus(
          {required List<Course> courses, required String filterStatus}) =>
      courses
          .where((course) =>
              course.completionStatus.toString().split('.').last ==
              filterStatus)
          .toList();

// get list of categories for library sections and search
  List<String> get getListOfCategories {
    Set<String> categories = Set();
    courses.forEach((element) => categories.add(element.categoryId));
    return categories.toList();
  }

// get map of counts of courses in all avaiable categories
  Map<String, int> get getCategoryCountMap {
    var categoryCountMap = Map<String, int>();
    courses.forEach((element) =>
        categoryCountMap.containsKey(element.categoryId)
            ? categoryCountMap.update(element.categoryId, (val) => val + 1)
            : categoryCountMap[element.categoryId] = 1);
    // print(categoryCountMap);
    return categoryCountMap;
  }

// convert list of course objects to Map object
  Map courseListToMap(List<Course> courseList) {
    Map _courseMap = new Map();
    for (var _course in courseList) {
      var _itemMap = _course.courseObjectToMap();
      _courseMap.putIfAbsent(_itemMap['id'], () => _itemMap);
    }
    print(_courseMap.keys);
    return _courseMap;
  }

// convert Map object to list of course objects
  List<Course> courseListFromMap(Map coursesListMap) {
    final List<Course> _courseList = [];
    coursesListMap.forEach((course, data) {
      final Course _course = Course.mapToCourseObject(data);
      // print('wah ${_course.title}');
      _courseList.add(_course);
    });
    return _courseList;
  }
}
