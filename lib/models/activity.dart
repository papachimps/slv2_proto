import 'package:flutter/material.dart';

enum ActivityType {
  Web,
  Message,
}

ActivityType responseActivityTypeMapper(activityType) =>
    activityType == "Image" ? ActivityType.Message : ActivityType.Web;

Map<String, Orientation> responseOrientationMap = {
  "": Orientation.portrait,
  "L": Orientation.landscape,
  "P": Orientation.portrait
};

String enumToString(Object object) => object.toString().split('.').last;

T enumFromString<T>(String key, List<T> values) =>
    values.firstWhere((v) => key == enumToString(v.toString()));

class Activity {
  final String id;
  final String title;
  final String imageUrl;
  final String departmentId;
  final DateTime? lastUpdatedAt; //must be parsable format
  final int? sortOrder;
  final Orientation? orientation;
  final String? mainUrl;
  final ActivityType activityType;

  Activity({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.departmentId,
    required this.activityType,
    this.lastUpdatedAt,
    this.sortOrder,
    this.mainUrl,
    this.orientation = Orientation.portrait,
  });

  Map objectToMap() => {
        '_id': id,
        'activity_name': title,
        'thumburl': imageUrl,
        'baseoption': departmentId,
        'update_at': lastUpdatedAt!.toIso8601String(),
        'mainurl': mainUrl,
        'sort_order': sortOrder,
        'displaytype': orientation,
        'activity_type': enumToString(ActivityType.Web),
      };

  static Activity mapToActivityObject(map) {
    return Activity(
      id: map['_id'],
      title: map['activity_name'],
      imageUrl: map['thumburl'],
      departmentId: map['baseoption'],
      lastUpdatedAt: DateTime.parse(map['update_at']),
      mainUrl: map['mainurl'],
      sortOrder: map['sort_order'],
      orientation: responseOrientationMap[map['displaytype']],
      activityType: responseActivityTypeMapper(map['activity_type']),
    );
  }
}
