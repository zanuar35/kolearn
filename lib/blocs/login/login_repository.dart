import 'dart:convert';

import 'package:kolearn/models/user/user_model.dart';
import 'package:http/http.dart' as http;

import '../../core/app_shared_preferences.dart';
import '../../core/app_url.dart';

class LoginRepository {
  String url = AppUrl.baseUrl;
  SharedPreferencesHelper sharedPreferencesHelper = SharedPreferencesHelper();

  Future<UserModel> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse("$url/api/login"),
        body: ({'email': username, 'password': password}),
      );
      Map<String, dynamic> data = jsonDecode(response.body);

      UserModel user = UserModel.fromJson(data);

      sharedPreferencesHelper.setIsLogin(true);
      sharedPreferencesHelper.setToken(data['token']);
      sharedPreferencesHelper.setUserId(data['user']['id']);
      sharedPreferencesHelper.setUserName(data['user']['name']);
      sharedPreferencesHelper.setUserNilai(nilai: data['user']['nilai']);

      return user;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
