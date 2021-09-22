import '../services/networkService.dart';

class ActivityInterface extends NetworkService {
  static const int departmentId = 9;
  static const String baseUrl = 'https://updatesandgames.spicelearn.in/';
  String activitiesUrl = '$baseUrl/activity/allactivitybytype?baseoption=$departmentId';
}
