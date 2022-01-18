// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:kolearn/models/user/user_regis.dart';
import 'package:http/http.dart' as http;

class UserRegisRepository {
  Future<List<UserRegist>> registrasiUser(String email, String pass) async {
    List<UserRegist> userRegist = [];
    Map data;
    var response = await http.post(
      Uri.parse("https://reqres.in/api/login"),
      body: ({'email': email, 'password': pass}),
    );
    try {
      data = json.decode(response.body);
      print(data);
    } catch (e) {
      print(e);
    }
    return userRegist;
  }
}
