// // ignore_for_file: avoid_print

// import 'dart:convert';
// import 'package:kolearn/models/user/user_model.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// class UserRepository {
//   String url = 'https://2e9b-103-178-13-98.ngrok.io';
//   String token = '';

//   Future<UserModel> fetchUsers(String email, String pass) async {
//     var response = await http.post(
//       Uri.parse("$url/api/login"),
//       body: ({'email': email, 'password': pass}),
//     );
//     UserModel user = UserModel.fromJson(jsonDecode(response.body));
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     print(response.body);
//     print(user.success);
//     prefs.setString('token', user.token);

//     print(user.token);
//     print('Prefs token : ' + prefs.getString('token').toString());
//     print(user.user);
//     return user;
//   }
// }
