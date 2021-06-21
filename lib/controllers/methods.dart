import '/models/course.dart';

// get bookmarkedCourses
List<Course> bookmarkedCourses(List<Course> courses) {
  List<Course> _bookmarkList = [];
  for (Course course in courses)
    if (course.isCourseBookMarked) _bookmarkList.add(course);
  return _bookmarkList;
}

// get courses list sorted by their DateTime.
List<Course> coursesSortedByRecent(List<Course> courses) {
  List<Course> _sortedList = courses;
  _sortedList.sort((a, b) => (b.lastUpdatedAt).compareTo(a.lastUpdatedAt));
  return _sortedList;
}

// get courses list sorted by their Title.
List<Course> coursesSortedByTitle(List<Course> courses) {
  List<Course> _sortedList = courses;
  _sortedList.sort((a, b) => (a.title).compareTo(b.title));
  return _sortedList;
}

// get courses list filtered by provided Category.
List<Course> coursesFilteredByCategory(
    {required List<Course> courses, required String filterCategory}) {
  List<Course> _sortedList = courses;
  _sortedList.where((course) => course.categoryId == filterCategory);
  return _sortedList;
}

// get courses list filtered by provided their Completion Status.
List<Course> coursesFilteredByCompletionStatus(
    {required List<Course> courses, required String filterStatus}) {
  List<Course> _sortedList = courses;
  _sortedList.where((course) =>
      course.completionStatus.toString().split('.').last == filterStatus);
  return _sortedList;
}
