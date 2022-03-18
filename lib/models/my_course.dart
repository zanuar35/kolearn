// To parse this JSON data, do
//
//     final myCourseModel = myCourseModelFromJson(jsonString);
import 'dart:convert';

MyCourseModel myCourseModelFromJson(String str) =>
    MyCourseModel.fromJson(json.decode(str));

String myCourseModelToJson(MyCourseModel data) => json.encode(data.toJson());

class MyCourseModel {
  MyCourseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  bool success;
  String message;
  List<Datum> data;

  factory MyCourseModel.fromJson(Map<String, dynamic> json) => MyCourseModel(
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
    required this.courseName,
    required this.courseId,
    required this.jumlahMateri,
    required this.status,
    required this.changedAt,
    required this.isSubmited,
  });

  int id;
  String courseName;
  int courseId;
  int jumlahMateri;
  String status;
  String changedAt;
  int isSubmited;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        courseName: json["course_name"],
        courseId: json["course_id"],
        jumlahMateri: json["jumlah_materi"],
        status: json["status"],
        changedAt: json["Changed_at"],
        isSubmited: json["is_submited"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "course_name": courseName,
        "course_id": courseId,
        "jumlah_materi": jumlahMateri,
        "status": status,
        "Changed_at": changedAt,
        "is_submited": isSubmited,
      };
}
