// To parse this JSON data, do
//
//     final courseDetailModel = courseDetailModelFromJson(jsonString);
import 'dart:convert';

CourseDetailModel courseDetailModelFromJson(String str) =>
    CourseDetailModel.fromJson(json.decode(str));

String courseDetailModelToJson(CourseDetailModel data) =>
    json.encode(data.toJson());

class CourseDetailModel {
  CourseDetailModel({
    required this.success,
    required this.message,
    required this.data,
  });

  bool success;
  String message;
  List<Datum> data;

  factory CourseDetailModel.fromJson(Map<String, dynamic> json) =>
      CourseDetailModel(
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
    required this.jumlahMateri,
    required this.status,
    required this.changedAt,
    required this.isSubmited,
  });

  int id;
  int userId;
  String courseName;
  int courseId;
  int jumlahMateri;
  String status;
  String changedAt;
  int isSubmited;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        courseName: json["course_name"],
        courseId: json["course_id"],
        jumlahMateri: json["jumlah_materi"],
        status: json["status"],
        changedAt: json["Changed_at"],
        isSubmited: json["is_submited"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "course_name": courseName,
        "course_id": courseId,
        "jumlah_materi": jumlahMateri,
        "status": status,
        "Changed_at": changedAt,
        "is_submited": isSubmited,
      };
}
