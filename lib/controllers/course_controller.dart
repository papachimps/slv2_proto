import 'dart:convert';
import 'package:get/state_manager.dart';

import '/services/networkservice.dart';
import '/models/course.dart';

class CoursesController extends GetxController {
  final networkService = NetworkService();
  final courses = <Course>[].obs;
  final isLoading = true.obs;

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

  String coursesToJson(List<Course> coursesList) =>
      json.encode(courseListToMap(coursesList));

  Future fetchCourses() async {
    final jsonResponse = await networkService.getData();
    final _coursesListMap = json.decode(jsonResponse);
    courses.addAll(courseListFromMap(_coursesListMap));
    coursesSortedByRecent();
    courses.forEach((element) => print([element.title, element.lastUpdatedAt]));
    isLoading.toggle();
  }

// get courses list sorted by their DateTime.
  void coursesSortedByRecent() =>
      courses.sort((a, b) => (b.lastUpdatedAt).compareTo(a.lastUpdatedAt));
  // _courses.forEach((element) => print([element.title, element.lastUpdatedAt]));

  Map courseListToMap(List<Course> courseList) {
    Map _courseMap = new Map();
    for (var _course in courseList) {
      var _itemMap = _course.courseObjectToMap();
      _courseMap.putIfAbsent(_itemMap['id'], () => _itemMap);
    }
    print(_courseMap.keys);
    return _courseMap;
  }

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
