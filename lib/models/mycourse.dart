import 'dart:convert';

MyCourseCategoryModel myCourseCategoryModelFromJson(String str) =>
    MyCourseCategoryModel.fromJson(json.decode(str));

String myCourseCategoryModelToJson(MyCourseCategoryModel data) =>
    json.encode(data.toJson());

class MyCourseCategoryModel {
  MyCourseCategoryModel({
    required this.success,
    required this.message,
    required this.data,
  });

  bool success;
  String message;
  List<Datum> data;

  factory MyCourseCategoryModel.fromJson(Map<String, dynamic> json) =>
      MyCourseCategoryModel(
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
    required this.changedAt,
    required this.title,
  });

  int id;
  int userId;
  String courseName;
  int courseId;
  String changedAt;
  String title;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        courseName: json["course_name"],
        courseId: json["course_id"],
        changedAt: json["changed_at"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "course_name": courseName,
        "course_id": courseId,
        "changed_at": changedAt,
        "title": title,
      };
}
