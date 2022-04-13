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
  Data data;

  factory CourseDetailModel.fromJson(Map<String, dynamic> json) =>
      CourseDetailModel(
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
