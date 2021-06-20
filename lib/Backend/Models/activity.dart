import 'package:flutter/material.dart';

enum ActivityType {
  Game,
  Web,
  Message,
}

class Activity {
  final String id;
  final List<String> targetDepartments;
  final DateTime? lastUpdatedAt; //must be parsable format
  final int? position;
  final Orientation orientation;
  final String? mainUrl;

  Activity({
    required this.id,
    required this.targetDepartments,
    this.lastUpdatedAt,
    this.position,
    this.mainUrl,
    this.orientation = Orientation.portrait,
  });
}
