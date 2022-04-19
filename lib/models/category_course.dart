import 'dart:convert';

CourseCategoryModel courseCategoryModelFromJson(String str) =>
    CourseCategoryModel.fromJson(json.decode(str));

String courseCategoryModelToJson(CourseCategoryModel data) =>
    json.encode(data.toJson());

class CourseCategoryModel {
  CourseCategoryModel({
    required this.status,
    required this.message,
    required this.data,
  });

  String status;
  String message;
  List<Datum> data;

  factory CourseCategoryModel.fromJson(Map<String, dynamic> json) =>
      CourseCategoryModel(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
