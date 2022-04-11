// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kolearn/core/app_url.dart';
import 'package:kolearn/models/course_detail.dart';
import 'package:kolearn/models/course_exist.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

part 'course_detail_state.dart';

class CourseDetailCubit extends Cubit<CourseDetailState> {
  CourseDetailCubit() : super(CourseDetailInitial());

  void getDetail(int id) async {
    String url = AppUrl.baseUrl;

    // get token from shared preference
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();

    emit(CourseDetailLoading());

    var response = await http.post(
      Uri.parse("$url/api/getDetailMateri"),
      body: ({
        'user_id': prefs.getInt('user_id').toString(),
        'course_id': id.toString()
      }),
      headers: {'Accept': 'application/json', "Authorization": 'Bearer $token'},
    );
    if (response.statusCode == 200 || response.statusCode == 401) {
      // get data from json

      var data = json.decode(response.body);
      print(data);
      print(data["success"]);
      if (data['success'] == true) {
        CourseDetailModel courseDetail = CourseDetailModel.fromJson(data);
        emit(CourseDetailSuccess(courseDetail));
      } else {
        CourseNewModel courseNew = CourseNewModel.fromJson(data);
        emit(CourseDetailNew(courseNew));
      }
    } else {
      print(response.statusCode);
      print('error' + response.body);
      emit(CourseDetailFailure('Failed to get data'));
    }
  }
}
