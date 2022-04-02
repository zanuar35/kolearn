import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kolearn/core/app_url.dart';
import 'package:kolearn/models/course_detail.dart';
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

    // get data course from API
    var response = await http.get(
      Uri.parse("$url/api/course/$id"),
      headers: {'Accept': 'application/json', "Authorization": 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      // get data from json
      var data = json.decode(response.body);
      CourseDetailModel courseDetail = CourseDetailModel.fromJson(data);
      emit(CourseDetailSuccess(courseDetail));
    } else {
      emit(CourseDetailFailure('Failed to get data'));
    }
  }
}
