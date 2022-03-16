// To parse this JSON data, do
//
//     final courseDetailModel = courseDetailModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CourseDetailModel courseDetailModelFromJson(String str) =>
    CourseDetailModel.fromJson(json.decode(str));

String courseDetailModelToJson(CourseDetailModel data) =>
    json.encode(data.toJson());

class CourseDetailModel {
  CourseDetailModel({
    required this.success,
    required this.data,
  });

  bool success;
  Data data;

  factory CourseDetailModel.fromJson(Map<String, dynamic> json) =>
      CourseDetailModel(
        success: json["Success"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "Success": success,
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
