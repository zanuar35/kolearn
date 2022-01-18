// To parse this JSON data, do
//
//     final userRegist = userRegistFromJson(jsonString);
import 'dart:convert';

UserRegist userRegistFromJson(String str) =>
    UserRegist.fromJson(json.decode(str));

String userRegistToJson(UserRegist data) => json.encode(data.toJson());

class UserRegist {
  UserRegist({
    required this.email,
    required this.password,
  });

  String email;
  String password;

  factory UserRegist.fromJson(Map<String, dynamic> json) => UserRegist(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
