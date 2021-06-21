import 'dart:math';
import 'package:flutter/material.dart';

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

Map<ModuleType, List<dynamic>> moduleTypeDict = {
  ModuleType.Doc: ['Document', Icons.library_books_outlined],
  ModuleType.Video: ['Video Module', Icons.theaters_rounded],
  ModuleType.Interactive: ['Interactive Module', Icons.note_alt_outlined],
  ModuleType.Web: ['Web Resource', Icons.web_rounded],
};


class Module {
  final String id;
  final String title;
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
    required this.lastUpdatedAt,
    required this.moduleType,
    required this.maxScorable,
    required this.courseId,
    this.description,
    this.orientation = Orientation.portrait,
    this.completionStatus = ModuleCompletionStatus.Pending,
  });

  double get userScore => Random().nextDouble() * maxScorable;


}
