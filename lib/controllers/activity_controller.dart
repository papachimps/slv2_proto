// https://updatesandgames.spicelearn.in/activity/allactivitybytype?baseoption=6

import 'dart:convert';

import 'package:get/get.dart';
import 'package:slv2/interface/activity_interface.dart';

import '../models/activity.dart';

class ActivityController extends GetxController {
  final baseUrl = ActivityInterface.baseUrl;
  final apiInterface = ActivityInterface();
  final activities = <Activity>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    fetchActivites();
    super.onInit();
  }

  String coursesToJson(List<Activity> activitiesList) =>
      json.encode(activityListToMap(activitiesList));

  Future fetchActivites() async {
    final jsonResponse = await apiInterface.getData(apiInterface.activitiesUrl);
    final List _listOfActivityMaps = json.decode(jsonResponse)["data"];
    _listOfActivityMaps.forEach((element) {
      final Activity _activity = Activity.mapToActivityObject(element);
      activities.add(_activity);
    });
    isLoading.toggle();
  }

  Map activityListToMap(List<Activity> items) {
    Map _activityMap = new Map();
    for (var _item in items) {
      var _itemMap = _item.objectToMap();
      _activityMap.putIfAbsent(_itemMap['_id'], () => _itemMap);
    }
    print(_activityMap.keys);
    return _activityMap;
  }
}
