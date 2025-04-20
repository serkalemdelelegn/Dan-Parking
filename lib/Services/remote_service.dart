import 'package:danparking/models/UserModel/user.dart';
import 'package:http/http.dart' as http;
import "package:shared_preferences/shared_preferences.dart";
import "dart:convert";

class RemoteService {
  String baseurl = "http://192.168.138.10:5000/";

  Future<User?> getMyInfo(String url) async {
    url = baseurl + url;

    http.Response response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      Map data = jsonDecode(response.body);

      pref.setString("id", "${data['_id']}");
      pref.setString('email', "${data['email']}");
      pref.setString('firstname', "${data['firstname']}");
      pref.setString('lastname', "${data['lastname']}");

      User user = User.fromJson(jsonDecode(response.body));
      return user;
    }
  }

  Future<int?> getFreeSpaceInfo(String url) async {
    url = baseurl + url;

    http.Response response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      int data = jsonDecode(response.body);
      return data;
    }
  }

  Future bookSpace(String url) async {
    url = baseurl + url;

    http.Response response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {}
  }
}
