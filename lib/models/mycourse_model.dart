// To parse this JSON data, do
//
//     final myCourseAllModel = myCourseAllModelFromJson(jsonString);
import 'dart:convert';

MyCourseAllModel myCourseAllModelFromJson(String str) =>
    MyCourseAllModel.fromJson(json.decode(str));

String myCourseAllModelToJson(MyCourseAllModel data) =>
    json.encode(data.toJson());

class MyCourseAllModel {
  MyCourseAllModel({
    required this.success,
    required this.message,
    required this.jumalahData,
    required this.data,
  });

  bool success;
  String message;
  int jumalahData;
  List<Datum> data;

  factory MyCourseAllModel.fromJson(Map<String, dynamic> json) =>
      MyCourseAllModel(
        success: json["success"],
        message: json["message"],
        jumalahData: json["jumalah data"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "jumalah data": jumalahData,
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
    required this.title,
  });

  int id;
  int userId;
  String courseName;
  int courseId;
  int jumlahMateri;
  String status;
  String changedAt;
  int isSubmited;
  String title;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        courseName: json["course_name"],
        courseId: json["course_id"],
        jumlahMateri: json["jumlah_materi"],
        status: json["status"],
        changedAt: json["Changed_at"],
        isSubmited: json["is_submited"],
        title: json["title"],
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
        "title": title,
      };
}
