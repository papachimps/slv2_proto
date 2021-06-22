import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum ModuleType {
  Video,
  Web,
  Interactive,
  Doc,
}

enum ModuleCompletionStatus {
  Pending,
  Completed,
}

String enumToString(Object object) => object.toString().split('.').last;

T enumFromString<T>(String key, List<T> values) =>
    values.firstWhere((v) => key == enumToString(v.toString()));

Map<ModuleType, List<dynamic>> moduleTypeDict = {
  ModuleType.Doc: ['Document', Icons.library_books_outlined],
  ModuleType.Video: ['Video Module', Icons.theaters_rounded],
  ModuleType.Interactive: ['Interactive Module', Icons.note_alt_outlined],
  ModuleType.Web: ['Web Resource', Icons.web_rounded],
};

class Module {
  final String id;
  final String title;
  final String moduleUrl;
  final DateTime lastUpdatedAt; //must be parsable format
  final String? description;
  final String courseId;
  final ModuleType moduleType;
  final double maxScorable;
  final Orientation orientation;
  ModuleCompletionStatus completionStatus;

  Module({
    required this.id,
    required this.title,
    required this.moduleUrl,
    required this.lastUpdatedAt,
    required this.moduleType,
    required this.maxScorable,
    required this.courseId,
    this.description,
    this.orientation = Orientation.portrait,
    this.completionStatus = ModuleCompletionStatus.Pending,
  });

  double get userScore => 0.5 * maxScorable;      //random value

  double moduleScore(String id) => maxScorable;

  String get formattedDate => DateFormat("dd MMM").format(lastUpdatedAt);

  static Module mapToModuleObject(Map moduleMap) => Module(
        id: moduleMap["id"] as String,
        title: moduleMap["title"] as String,
        moduleUrl: moduleMap["moduleUrl"] as String,
        description: moduleMap["description"] as String,
        lastUpdatedAt: DateTime.parse(moduleMap["lastUpdatedAt"]),
        orientation:
            enumFromString(moduleMap["orientation"], Orientation.values),
        courseId: moduleMap["courseId"] as String,
        moduleType: enumFromString(moduleMap["moduleType"], ModuleType.values),
        completionStatus: enumFromString(
            moduleMap["completionStatus"], ModuleCompletionStatus.values),
        maxScorable: moduleMap["maxScorable"] as double,
      );

  Map moduleObjectToMap() => {
        'id': id,
        'title': title,
        'description': description,
        'moduleUrl': moduleUrl,
        'courseId': courseId,
        'lastUpdatedAt': lastUpdatedAt.toIso8601String(),
        "orientation": enumToString(orientation),
        "moduleType": enumToString(moduleType),
        "completionStatus": enumToString(completionStatus),
        "maxScorable": maxScorable,
      };
}
