import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.success,
    required this.user,
    required this.token,
  });

  bool success;
  User user;
  String token;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        success: json["success"],
        user: User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "user": user.toJson(),
        "token": token,
      };
}

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.gender,
    required this.telp,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.nilai,
  });

  int id;
  String name;
  String email;
  String gender;
  String telp;
  dynamic emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;
  int nilai;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        gender: json["gender"],
        telp: json["telp"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        nilai: json["nilai"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "gender": gender,
        "telp": telp,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "nilai": nilai,
      };
}
