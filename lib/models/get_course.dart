// To parse this JSON data, do
//
//     final getCourseModel = getCourseModelFromJson(jsonString);

import 'dart:convert';

GetCourseModel getCourseModelFromJson(String str) =>
    GetCourseModel.fromJson(json.decode(str));

String getCourseModelToJson(GetCourseModel data) => json.encode(data.toJson());

class GetCourseModel {
  GetCourseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  bool success;
  String message;
  List<Datum> data;

  factory GetCourseModel.fromJson(Map<String, dynamic> json) => GetCourseModel(
        success: json["success"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.userId,
    required this.courseName,
    required this.courseId,
    required this.status,
    required this.changedAt,
    required this.title,
  });

  int id;
  int userId;
  String courseName;
  int courseId;
  String status;
  String changedAt;
  String title;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        courseName: json["course_name"],
        courseId: json["course_id"],
        status: json["status"],
        changedAt: json["changed_at"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "course_name": courseName,
        "course_id": courseId,
        "status": status,
        "changed_at": changedAt,
        "title": title,
      };
}
