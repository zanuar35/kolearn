// To parse this JSON data, do
//
//     final courseNewModel = courseNewModelFromJson(jsonString);
import 'dart:convert';

CourseNewModel courseNewModelFromJson(String str) =>
    CourseNewModel.fromJson(json.decode(str));

String courseNewModelToJson(CourseNewModel data) => json.encode(data.toJson());

class CourseNewModel {
  CourseNewModel({
    required this.success,
    required this.message,
    required this.data,
  });

  bool success;
  String message;
  Data data;

  factory CourseNewModel.fromJson(Map<String, dynamic> json) => CourseNewModel(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.id,
    required this.courseName,
    required this.title,
    required this.category,
    required this.isSubmited,
  });

  int id;
  String courseName;
  String title;
  String category;
  int isSubmited;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        courseName: json["course_name"],
        title: json["title"],
        category: json["category"],
        isSubmited: json["is_submited"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "course_name": courseName,
        "title": title,
        "category": category,
        "is_submited": isSubmited,
      };
}
