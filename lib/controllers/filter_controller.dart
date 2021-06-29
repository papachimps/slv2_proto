import '/models/course.dart';
import 'package:get/get.dart';

// import 'course_controller.dart';

class FilterController extends GetxController {
  // final coursesController = Get.put(CoursesController());
  List<Course> filteredCourses = <Course>[];

//get all courses
  // List<Course> get allCourses => coursesController.courses;

// get bookmarkedCourses
  List<Course> bookmarkedCourses(List<Course> courses) {
    List<Course> _bookmarkList = [];
    for (Course course in courses)
      if (course.isCourseBookMarked) _bookmarkList.add(course);
    return _bookmarkList;
  }

// get courses list sorted by their DateTime.
  void coursesSortedByRecent(List<Course> courses) {
    courses.sort((a, b) => (b.lastUpdatedAt).compareTo(a.lastUpdatedAt));
    courses.forEach((element) => print([element.title, element.lastUpdatedAt]));
    filteredCourses = courses;
  }

// get courses list sorted by their Title.
  void coursesSortedByTitle(List<Course> courses) {
    courses.sort((a, b) => (a.title).compareTo(b.title));
    filteredCourses = courses;
  }

// get courses list filtered by provided Category.
  void coursesFilteredByCategory(
      {required List<Course> courses, required String filterCategory}) {
    courses.where((course) => course.categoryId == filterCategory);
    filteredCourses = courses;
  }

// get courses list filtered by provided their Completion Status.
  List<Course> coursesFilteredByCompletionStatus(
      {required List<Course> courses, required String filterStatus}) {
    List<Course> _sortedList = courses;
    _sortedList.where((course) =>
        course.completionStatus.toString().split('.').last == filterStatus);
    return _sortedList;
  }
}
