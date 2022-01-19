// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:kolearn/models/user/user_logout.dart';
import 'package:kolearn/models/user/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  String url = 'https://0618-103-178-13-2.ngrok.io';
  String token = '';

  Future<UserLogout> logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();
    print(token);
    var response = await http.post(
      Uri.parse("$url/api/logout"),
      headers: {'Accept': 'application/json', "Authorization": 'Bearer $token'},
    );
    print(response.statusCode);
    print(response.body);
    UserLogout user = UserLogout.fromJson(jsonDecode(response.body));
    print(user.success);
    return user;
  }

  Future<User> fetchUsers(String email, String pass) async {
    var response = await http.post(
      Uri.parse("$url/api/login"),
      body: ({'email': email, 'password': pass}),
    );
    User user = User.fromJson(jsonDecode(response.body));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(response.body);
    print(user.success);
    prefs.setString('token', user.token);

    print(user.token);
    print('Prefs token : ' + prefs.getString('token').toString());
    print(user.user);
    return user;
  }
}


 // try {
    //   data = json.decode(response.body);
    //   print("berhasil " + data.toString());
    //   print(user);
    // } catch (e) {
    //   print("gagal " + e.toString());
    // }

     // if (response.statusCode == 200) {
    //   print("berhasil login");
    // } else {
    //   print(response.body);
    //   print("gagal login");
    // }