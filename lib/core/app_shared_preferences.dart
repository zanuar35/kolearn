import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  Future<bool> setIsLogin(bool isLogin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool('isLogin', isLogin);
  }

  Future<bool?> getIsLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isLogin = prefs.getBool('isLogin');
    return isLogin;
  }

  // Set Token in SharedPreferences
  Future<String> setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String tokenKey = prefs.setString('token', token).toString();
    return tokenKey;
  }

  // Get Token from SharedPreferences
  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();
    return token;
  }

  // Set username shared preference
  Future<String> setUserName(String userName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userName', userName);
    return userName;
  }

  // Get username shared preference
  Future<String?> getUserName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // String userName = prefs.getString('userName').toString();
    String? userName = prefs.getString('userName');
    return userName;
  }

  Future<int> setUserId(int id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('user_id', id);
    return id;
  }

  Future<int?> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getInt('user_id');
  }

  Future<int> setCourseLength(int length) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('courseLength', length);
    return length;
  }

  Future<int?> getCourseLength() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('courseLength');
  }

  Future<int> setUserNilai({required int nilai}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('user_nilai', nilai);
    return nilai;
  }

  Future<int?> getUserNilai() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('user_nilai');
  }
}
