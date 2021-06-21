import 'course.dart';

class Category {
  final String id;
  final String title;
  final String? imageUrl;
  final List<Course> courses;
  final Map<int, String> categoryRanking;
  final int userCategoryRank;

  Category({
    required this.id,
    required this.title,
    this.imageUrl,
    this.courses = const [],
    this.userCategoryRank = 32, //random
    this.categoryRanking = const {
      //random
      0: 'userId_x',
      1: 'userId_y',
      2: 'userId_z',
    },
  });

  // get total no. of courses in the category
  int get courseCount => courses.length;

  // get total user Score in the category
  double get categoryUserScore {
    double _sum = 0;
    for (Course course in courses)
      if (course.categoryId == id) _sum += course.userScore;
    return _sum;
  }

  // get courses list sorted by their date
  List<Course> get coursesSortedByRecent {
    List<Course> _sortedList = courses;
    _sortedList.sort((a, b) => (b.lastUpdatedAt).compareTo(a.lastUpdatedAt));
    return _sortedList;
  }

  // get courses list sorted by their title.
  List<Course> get coursesSortedByAlphabet {
    List<Course> _sortedList = courses;
    _sortedList.sort((a, b) => (a.title).compareTo(b.title));
    return _sortedList;
  }
}
