// ignore_for_file: avoid_print
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kolearn/core/app_url.dart';
import 'package:kolearn/models/category_course.dart';
import 'package:kolearn/models/course.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

part 'course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  CourseCubit() : super(CourseInitial());

  void fetchCourse() async {
    // get url end-point API
    String url = AppUrl.baseUrl;

    // get token from shared preference
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();

    // Loading state
    emit(CourseLoading());

    // get data course from API
    var response = await http.get(
      Uri.parse("$url/api/course"),
      headers: {'Accept': 'application/json', "Authorization": 'Bearer $token'},
    );

    // check response status
    if (response.statusCode == 200) {
      // get data from response
      final Map parsed = json.decode(response.body);
      Course course = Course.fromJson(parsed);
      List<Data> kursus = course.data;

      // set data course to state
      // Success state
      emit(CourseSuccess(kursus));
    }
  }

  void getCourseCategory(int i) async {
    // get url end-point API
    String url = AppUrl.baseUrl;

    // get token from shared preference
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();

    // Loading state
    emit(CourseLoading());

    // get data course from API
    var response = await http.post(
      Uri.parse("$url/api/getCourseByCategory"),
      headers: {'Accept': 'application/json', "Authorization": 'Bearer $token'},
      body: {
        "category_id": i.toString(),
      },
    );

    // check response status
    if (response.statusCode == 200) {
      // get data from response
      final Map<String, dynamic> parsed = json.decode(response.body);
      CourseCategoryModel course = CourseCategoryModel.fromJson(parsed);
      List<Datum> kurses = course.data;

      print(response.body);

      // set data course to state
      // Success state
      emit(CourseBerhasil(kurses));
    } else {
      emit(const CourseFailure("Terjadi kesalahan saat mengambil data"));
    }
  }
}
