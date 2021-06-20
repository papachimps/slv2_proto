import 'module.dart';

enum CourseCompletionStatus {
  Pending,
  Completed,
  OverDue,
}

class Course {
  final String id;
  final String title;
  final String? imageUrl;
  final DateTime lastUpdatedAt; //must be parsable format
  final String? description;
  final String categoryId;
  final List<Module> modules;
  bool isCourseBookMarked;
  CourseCompletionStatus completionStatus;

  Course({
    required this.id,
    required this.title,
    required this.lastUpdatedAt,
    required this.categoryId,
    this.imageUrl,
    this.description,
    this.modules = const [],
    this.completionStatus = CourseCompletionStatus.Pending,
    this.isCourseBookMarked = false,
  });

  double get totalScore {
    double _sum = 0;
    for (Module module in modules) _sum += module.maxScorable;
    return _sum;
  }

  double get userScore {
    double _sum = 0;
    for (Module module in modules) _sum += module.userScore;
    return _sum;
  }
}
