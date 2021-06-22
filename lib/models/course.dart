import 'package:intl/intl.dart';

import 'module.dart';

enum CourseCompletionStatus {
  Pending,
  Completed,
  OverDue,
}

String enumToString(Object object) => object.toString().split('.').last;

T enumFromString<T>(String key, List<T> values) =>
    values.firstWhere((v) => key == enumToString(v.toString()));

class Course {
  String id;
  String title;
  String imgUrl;
  String? description;
  String categoryId;
  DateTime lastUpdatedAt;
  List<Module> modules;
  bool isCourseBookMarked;
  CourseCompletionStatus completionStatus;

  Course({
    required this.id,
    required this.title,
    required this.categoryId,
    required this.imgUrl,
    this.description,
    required this.lastUpdatedAt,
    required this.modules,
    this.isCourseBookMarked = false,
    this.completionStatus = CourseCompletionStatus.Pending,
  });

  String get formattedDate => DateFormat("dd MMM, yy").format(lastUpdatedAt);

  double get totalScore => modules.fold(
      0, (previousVal, module) => previousVal + module.maxScorable);

  double get userScore =>
      modules.fold(0, (previousVal, module) => previousVal + module.userScore);

  Map courseObjectToMap() => {
        'id': id,
        'title': title,
        'description': description,
        'imgUrl': imgUrl,
        'categoryId': categoryId,
        'lastUpdatedAt': lastUpdatedAt.toIso8601String(),
        'isCourseBookMarked': isCourseBookMarked,
        'completionStatus': enumToString(completionStatus),
        'modules': modules.map((m) => m.moduleObjectToMap()).toList()
      };

  static Course mapToCourseObject(courseMap) {
    List modulesMapList = courseMap['modules'];
    // print(modulesMapList[0]);
    List<Module> modulesList = modulesMapList
        .map((moduleMap) => Module.mapToModuleObject(moduleMap))
        .toList();
    return Course(
      id: courseMap['id'],
      title: courseMap['title'],
      description: courseMap['description'],
      categoryId: courseMap['categoryId'],
      imgUrl: courseMap['imgUrl'],
      lastUpdatedAt: DateTime.parse(courseMap['lastUpdatedAt']),
      completionStatus: enumFromString(
          courseMap['completionStatus'], CourseCompletionStatus.values),
      isCourseBookMarked: courseMap['isCourseBookMarked'] as bool,
      modules: modulesList,
    );
  }
}
