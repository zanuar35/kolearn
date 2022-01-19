// To parse this JSON data, do
//
//     final userLogout = userLogoutFromJson(jsonString);
import 'dart:convert';

UserLogout userLogoutFromJson(String str) =>
    UserLogout.fromJson(json.decode(str));

String userLogoutToJson(UserLogout data) => json.encode(data.toJson());

class UserLogout {
  UserLogout({
    required this.success,
    required this.message,
  });

  bool success;
  String message;

  factory UserLogout.fromJson(Map<String, dynamic> json) => UserLogout(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
      };
}
