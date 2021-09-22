import 'package:http/http.dart' as http;


class NetworkService {
  Future<String> getData(String url) async {
      final response = await http.get(Uri.parse(url));
      print('getData response: ${response.body.length}');
      return response.body;
  }

  Future postData({required String url, required String jsonString}) async {
    var response = await http.put((Uri.parse(url)), body: jsonString);
    print('Response Status postData response: ${response.body.length}');
  }
}
