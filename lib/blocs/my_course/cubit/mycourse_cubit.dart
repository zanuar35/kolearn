// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kolearn/core/app_url.dart';
import 'package:http/http.dart' as http;
import 'package:kolearn/models/get_course.dart';
import 'package:kolearn/models/mycourse.dart';
import 'package:kolearn/models/mycourse_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'mycourse_state.dart';

class MycourseCubit extends Cubit<MycourseState> {
  MycourseCubit() : super(MycourseInitial());

  void saveCourse(
      String courseName, String id, String jumlahMateri, String status) async {
    String url = AppUrl.baseUrl;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();
    int? userId = prefs.getInt('user_id');

    emit(MycourseLoading());

    var response = await http.post(
        Uri.parse(
          "$url/api/myCourse",
        ),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: ({
          'user_id': '$userId',
          'course_name': courseName,
          'course_id': id,
          'jumlah_materi': jumlahMateri,
          'status': status,
          'is_submited': '1',
        }));

    if (response.statusCode == 201) {
      Map<String, dynamic> map = json.decode(response.body);
      print(map);
      print('200 ${map['data']['id']}');
      prefs.setInt('course_id', map['data']['id']);
      emit(MycourseSuccessUpdate());
    } else {
      print("Gagal");
    }
  }

  void getCourse() async {
    String url = AppUrl.baseUrl;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();

    int? userId = prefs.getInt('user_id');

    emit(MycourseLoading());

    var response = await http.get(
        Uri.parse(
          "$url/api/getCourse/$userId",
        ),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == 200) {
      print(response.body);
      GetCourseModel getCourseModel = GetCourseModel.fromJson(
        json.decode(response.body),
      );

      emit(MycourseSuccess(getCourseModel.data));
    } else {
      print(response.body);
      emit(const MycourseError(error: "error"));
    }
  }

  void updateCourse(String id) async {
    String url = AppUrl.baseUrl;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();
    int? userId = prefs.getInt('user_id');
    //String courseId = prefs.getInt('course_id').toString();

    emit(MycourseLoading());
    print("user id : $userId , course id : $id");

    var response = await http.post(
      Uri.parse(
        "$url/api/updateCourse",
      ),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: ({
        "user_id": "$userId",
        "course_id": id,
        "status": "progress",
      }),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      print(map);
      emit(MycourseSuccessUpdate());
    } else {
      print(response.body);
      emit(const MycourseError(error: "error"));
    }
  }

  void getCourseStatus(String status) async {
    String url = AppUrl.baseUrl;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();

    emit(MycourseLoading());

    var response = await http.post(
        Uri.parse(
          "$url/api/getCourseStatus",
        ),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: {
          'user_id': prefs.getInt('user_id').toString(),
          'status': status,
        });

    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      MyCourseCategoryModel myCourseCategoryModel =
          MyCourseCategoryModel.fromJson(map);
      emit(MycourseLoaded(myCourseCategoryModel.data));
    } else {
      print(response.body);
      emit(const MycourseError(error: "error"));
    }
  }

  void getCourseByUid() async {
    String url = AppUrl.baseUrl;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();
    int? userId = prefs.getInt('user_id');

    emit(MycourseLoading());
    var response = await http.post(
        Uri.parse(
          "$url/api/getCoursebyUid",
        ),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: {
          'user_id': "$userId",
        });

    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      MyCourseAllModel myCourseAllModel = MyCourseAllModel.fromJson(map);
      emit(MycourseLoaded(myCourseAllModel.data));
    } else {
      print(response.body);
      emit(const MycourseError(error: "error"));
    }
  }
}
