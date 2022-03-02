// ignore_for_file: avoid_print
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kolearn/core/app_url.dart';
import 'package:kolearn/models/course.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

part 'course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  CourseCubit() : super(CourseInitial());

  void fetchCourse() async {
    String url = AppUrl.baseUrl;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();

    emit(CourseLoading());
    var response = await http.get(
      Uri.parse("$url/api/course"),
      headers: {'Accept': 'application/json', "Authorization": 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      final Map parsed = json.decode(response.body);
      Course course = Course.fromJson(parsed);
      List<Data> kursus = course.data;

      emit(CourseSuccess(kursus));
    }
  }
}
