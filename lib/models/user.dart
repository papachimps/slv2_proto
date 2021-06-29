import 'course.dart';

class User {
  final String id;
  final String fullName;
  final String? profileUrl;
  final String? designation;
  final String? departmentId;
  final String? baseId;
  final String? zoneId;
  final List<Course> courses;
  final int userDepartmentRank;
  final Map<int, String> departmentRanking;

  User({
    required this.id,
    required this.fullName,
    this.profileUrl,
    this.designation,
    this.departmentId = 'INF', //random
    this.baseId = 'GGN', //random
    this.zoneId = 'North', //random
    this.courses = const [], //random
    this.userDepartmentRank = 54, //random
    this.departmentRanking = const {
      //random
      0: 'userId_x',
      1: 'userId_y',
      2: 'userId_z',
    },
  });

// get total user Score from courses
  double get totalUserScore {
    double _sum = 0;
    for (Course course in courses) _sum += course.userScore;
    return _sum;
  }

// get total course count from courses
  int get totalCourseCount => courses.length;
}
