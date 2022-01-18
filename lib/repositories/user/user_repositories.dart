// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:kolearn/models/user/user_model.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  Future<List<User>> fetchUsers(String email, String pass) async {
    List<User> user = [];
    Map data;
    var response = await http.post(
      Uri.parse("https://reqres.in/api/login"),
      body: ({'email': email, 'password': pass}),
    );
    try {
      data = json.decode(response.body);
      print(data['token']);
    } catch (e) {
      print(e);
    }
    // if (response.statusCode == 200) {
    //   data = json.decode(response.body);
    //   print(data['token']);
    // } else {
    //   print("login gagal");
    // }
    return user;
  }
}
